import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/presentation/screen/screen1.dart';
import 'package:bloc_qweqwe/presentation/screen/screen2.dart';
import 'package:bloc_qweqwe/presentation/screen/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const Screen1(title: "Screen1", color: Colors.blueAccent));
      case '/screen2':
        return MaterialPageRoute(
            builder: (_) =>
                const Screen2(title: "Screen2", color: Colors.yellowAccent));
      case '/screen3':
        return MaterialPageRoute(
            builder: (_) =>
                const Screen3(title: "Screen3", color: Colors.redAccent));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
