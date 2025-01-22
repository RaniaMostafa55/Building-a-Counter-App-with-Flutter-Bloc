import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterCubitInitial());

  int counterValue = 0;

  void increment() {
    counterValue += 1;
    emit(CounterIncrement());
    if (counterValue == 10 || counterValue == -10) {
      emit(CounterTen());
    }
  }

  void decrement() {
    counterValue -= 1;
    emit(CounterDecrement());
    if (counterValue == -1) {
      emit(CounterNegative());
    } else if (counterValue == 10 || counterValue == -10) {
      emit(CounterTen());
    }
  }
}
