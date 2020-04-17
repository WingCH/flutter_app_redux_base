
import 'package:flutterappreduxbase/redux/config/config_reducer.dart';
import 'package:flutterappreduxbase/redux/counter/counter_reducer.dart';

import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    configState: configReducer(state.configState, action),
    counterState: counterReducer(state.counterState, action),
  );
}
