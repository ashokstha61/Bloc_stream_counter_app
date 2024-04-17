import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterSuccessState(count: 0));

  increase() async {
    if (state is CounterSuccessState) {
      int previousValue = (state as CounterSuccessState).count;
      emit(CounterLoadingState());
      await Future.delayed(Duration(seconds: 1));
      emit(CounterSuccessState(count: previousValue + 1));
    }
  }
}
