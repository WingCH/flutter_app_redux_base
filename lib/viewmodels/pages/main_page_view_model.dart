
import 'package:flutterappreduxbase/redux/app/app_state.dart';
import 'package:flutterappreduxbase/redux/counter/counter_actions.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  final String lang;
  final String url;
  final Function addCounter;

  MainPageViewModel({
    @required this.lang,
    @required this.url,
    @required this.addCounter,
  });

  static MainPageViewModel fromStore(
    Store<AppState> store,
  ) {
    return MainPageViewModel(
      lang: store.state.configState.lang,
      url: store.state.configState.url,
      addCounter: (){
        store.dispatch(AddCounterAction());
      }
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is MainPageViewModel &&
            runtimeType == other.runtimeType &&
            lang == other.lang &&
            url == other.url;
  }

  @override
  int get hashCode {
    return lang.hashCode ^ url.hashCode;
  }
}
