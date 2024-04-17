abstract class CounterState {}

class CounterLoadingState extends CounterState {}

class CounterSuccessState extends CounterState {
  final int count;

  CounterSuccessState({required this.count});
}

class CounterErrorState extends CounterState {}
