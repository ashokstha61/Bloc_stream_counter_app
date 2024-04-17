import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/cubit/counter_cubit.dart';
import 'package:stream_bloc/cubit/counter_state.dart';

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
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is CounterSuccessState) {
                    return Text(
                      "${state.count}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    );
                  } else {
                    return CupertinoActivityIndicator();
                  }
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
