import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stream_bloc/counter_repository.dart';
import 'package:stream_bloc/counter_second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Counter main page'),
    );
  }
}

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
            StreamBuilder<int>(
              stream: CounterRepository.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
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
                    builder: (context) => CounterSecondScreen(),
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
          CounterRepository.incrementCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
