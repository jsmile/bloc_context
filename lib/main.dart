import 'package:bloc_context/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Access',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Bloc Access Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => CounterCubit(),
          child: const ChildWidget(),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          // build() 에서 제공하는 context 에 CounterCubit 이 위치하도록 별도의 child widget 으로 분리시킴
          // '${BlocProvider.of<CounterCubit>(context).state.counter}',
          '${context.watch<CounterCubit>().state.counter}',
          // style: Theme.of(context).textTheme.headlineMedium,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 52.0,
          ),
        ),
        ElevatedButton(
          child: const Text(
            'increment',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            // BlocProvider.of<CounterCubit>(context).increment();
            context.read<CounterCubit>().increment();
          },
        ),
      ],
    );
  }
}
