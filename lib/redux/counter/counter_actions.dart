import 'package:flutterappreduxbase/models/counter.dart';

class LoadingAddCounterAction {}

class AddCounterAction {}

class UpdateCounterAction {
  final Counter counter;

  UpdateCounterAction(this.counter);

  toJson() {
    return {'counter': counter.toJson()};
  }
}
