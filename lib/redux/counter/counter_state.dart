import 'package:flutterappreduxbase/models/counter.dart';
import 'package:flutterappreduxbase/models/loading_status.dart';
import 'package:meta/meta.dart';

@immutable
class CounterState {
  final LoadingStatus counterStatus;
  final Counter counter;

  CounterState({
    @required this.counterStatus,
    @required this.counter,
  });

  factory CounterState.initial() {
    return CounterState(
      counter: Counter(0),
      counterStatus: LoadingStatus.idle,
    );
  }

  CounterState copyWith({
    LoadingStatus counterStatus,
    Counter counter,
  }) {
    return CounterState(
      counterStatus: counterStatus ?? this.counterStatus,
      counter: counter ?? this.counter,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is CounterState &&
            runtimeType == other.runtimeType &&
            counter == other.counter;
  }

  @override
  int get hashCode {
    return counter.hashCode;
  }

  toJson() {
    return {
      'LoadingStatus': counterStatus.toString(),
      'Counter': counter.toJson()
    };
  }
}
