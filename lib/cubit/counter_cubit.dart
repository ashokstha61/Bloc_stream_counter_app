import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/cubit/counter_repository.dart';
import 'package:stream_bloc/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final CounterRepository repository;
  CounterCubit({required this.repository})
      : super(CounterSuccessState(count: repository.Count));

  increase() async {
    emit(CounterLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(CounterSuccessState(count: repository.Count));
  }
}
