import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/presentation/router/app_router.dart';
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
  final AppRoute _appRoute = AppRoute();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("--------------- BUILD METHOD ---------------");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRoute.onGeneratedRoute,
    );
  }
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
