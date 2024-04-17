class CounterRepository {
  int _count = 0;

  int get Count => _count;

  Future<void> increase() async {
    await Future.delayed(Duration(seconds: 1));
    _count++;
  }
}
