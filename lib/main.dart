import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'redux/app/app_reducer.dart';
import 'redux/app/app_state.dart';
import 'redux/counter/counter_middleware.dart';
import 'ui/pages/main_page.dart';
import 'utils/keys.dart';
import 'utils/routers.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
