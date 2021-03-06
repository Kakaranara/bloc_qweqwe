import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/logic/cubit/internet_cubit.dart';
import 'package:bloc_qweqwe/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRoute: AppRoute(), connectivity: Connectivity(),));
}

class MyApp extends StatefulWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.appRoute, required this.connectivity})
      : super(key: key);

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: widget.connectivity) ),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRoute.onGeneratedRoute,
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
