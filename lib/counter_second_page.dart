import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stream_bloc/counter_repository.dart';

class CounterSecondScreen extends StatelessWidget {
  const CounterSecondScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ValueListenableBuilder<int>(
              //   valueListenable: CounterRepository.count,
              //   builder: (context, count, _) {
              //     return Text(
              //       "${count}",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 30,
              //       ),
              //     );
              //   },
              // ),
              StreamBuilder<int>(
                stream: CounterRepository.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    "${snapshot.data}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  CounterRepository.incrementCount();
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
