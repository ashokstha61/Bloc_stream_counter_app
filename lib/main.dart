import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/cubit/counter_repository.dart';
import 'package:stream_bloc/counter_second_page.dart';
import 'package:stream_bloc/cubit/counter_cubit.dart';
import 'package:stream_bloc/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CounterRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => CounterCubit(
            repository: context.read<CounterRepository>(),
          ),
          child: const MyHomePage(title: 'Counter main page'),
        ),
      ),
    );
  }
}
