import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterappreduxbase/redux/app/app_state.dart';
import 'package:flutterappreduxbase/ui/widgets/counter_label.dart';
import 'package:flutterappreduxbase/viewmodels/pages/main_page_view_model.dart';
import 'package:random_color/random_color.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      distinct: true,
      converter: (store) => MainPageViewModel.fromStore(store),
      builder: (_, viewModel) {
        return _MainPageContent(viewModel: viewModel);
      },
    );
  }
}

class _MainPageContent extends StatelessWidget {
  final MainPageViewModel viewModel;

  const _MainPageContent({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = RandomColor().randomColor();

    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Example'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.addCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Text(
            viewModel.lang,
            style: TextStyle(
              color: color,
            ),
          ),
          Text(
            viewModel.url,
            style: TextStyle(
              color: color,
            ),
          ),
          Expanded(
            child: Center(
              child: CounterLabel(),
            ),
          ),
        ],
      ),
    );
  }
}
