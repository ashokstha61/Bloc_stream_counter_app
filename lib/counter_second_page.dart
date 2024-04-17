import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/cubit/counter_cubit.dart';

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
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    "$state",
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
                  // BlocProvider.of<CounterCubit>(context).increase();
                  context.read<CounterCubit>().increase();
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
