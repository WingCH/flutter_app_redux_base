import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'redux/app/app_reducer.dart';
import 'redux/app/app_state.dart';
import 'redux/counter/counter_middleware.dart';
import 'ui/pages/main_page.dart';
import 'utils/keys.dart';
import 'utils/routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlipperClient flipperClient = FlipperClient.getDefault();

  flipperClient.addPlugin(new FlipperNetworkPlugin(
      // If you use http library, you must set it to false and use https://pub.dev/packages/flipperkit_http_interceptor
      // useHttpOverrides: false,
      // Optional, for filtering request
      filter: (HttpClientRequest request) {
    String url = '${request.uri}';
    if (url.startsWith('https://via.placeholder.com') ||
        url.startsWith('https://gravatar.com')) {
      return false;
    }
    return true;
  }));
  flipperClient.addPlugin(new FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
  flipperClient.start();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      CounterMiddleware(),
      LoggingMiddleware.printer(),
    ],
  );

  runApp(
    ReduxApp(store: store),
  );
}

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Redux Example",
        navigatorKey: Keys.navigatorKey,
        routes: {
          Routes.home: (context) {
            return MainPage();
          },
        },
      ),
    );
  }
}
