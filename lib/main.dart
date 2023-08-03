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
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // Provider() 하위에 Builder widget 으로 CounterCubit 으로 포함하는 context 제공
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
            },
          ),
        ),
      ),
    );
  }
}
