import 'package:flutterappreduxbase/models/loading_status.dart';
import 'package:flutterappreduxbase/redux/counter/counter_actions.dart';
import 'package:flutterappreduxbase/redux/counter/counter_state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is LoadingAddCounterAction) {
    return state.copyWith(counterStatus: LoadingStatus.loading);
  } else if (action is UpdateCounterAction) {
    return state.copyWith(
        counterStatus: LoadingStatus.idle, counter: action.counter);
  }
  return state;
}
