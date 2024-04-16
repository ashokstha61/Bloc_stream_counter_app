import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CounterRepository {
  // static final ValueNotifier<int> count = ValueNotifier(0);
  static int _currentCount = 0;

  // static final StreamController<int> _streamController =
  //     StreamController<int>.broadcast();
  static final BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();

  // static Stream<int> get counterStream => _streamController.stream;
  static Stream<int> get counterStream => _counterSubject.stream;

  static void incrementCount() {
    _currentCount++;
    // _streamController.sink.add(_currentCount);
    _counterSubject.sink.add(_currentCount);
  }
}
