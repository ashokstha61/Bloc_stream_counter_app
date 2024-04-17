import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/counter_second_page.dart';
import 'package:stream_bloc/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // ValueListenableBuilder<Object>(
            //     valueListenable: CounterRepository.count,
            //     child: Container(
            //       height: 100,
            //       width: 100,
            //       color: Colors.red,
            //     ),
            //     builder: (context, count, child) {
            //       return Column(
            //         children: [
            //           Text(
            //             '$count',
            //             style: Theme.of(context).textTheme.headlineMedium,
            //           ),
            //           child!,
            //         ],
            //       );
            //     }),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  "$state",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      // value: BlocProvider.of<CounterCubit>(context),
                      value: context.read<CounterCubit>(),
                      child: CounterSecondScreen(),
                    ),
                  ),
                );
              },
              child: Text("Go to next page."),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // BlocProvider.of<CounterCubit>(context).increase();
          context.read<CounterCubit>().increase();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
