import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/presentation/screen/screen1.dart';
import 'package:bloc_qweqwe/presentation/screen/screen2.dart';
import 'package:bloc_qweqwe/presentation/screen/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("--------------- BUILD METHOD ---------------");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/screen1': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: Screen1(
                title: "screen1",
                color: Colors.blueAccent,
              ),
            ),
        '/screen2': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: Screen2(
                title: "Screen2",
                color: Colors.amberAccent,
              ),
            ),
        '/screen3' : (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: Screen3(title: "Screen3", color: Colors.redAccent)
            )
      },
      initialRoute: '/screen1',
    );
  }
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
