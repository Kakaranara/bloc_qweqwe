import 'dart:developer';

import 'package:bloc_qweqwe/constant/enums.dart';
import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/presentation/screen/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/enums.dart';
import '../../constant/enums.dart';
import '../../constant/enums.dart';
import '../../logic/cubit/internet_cubit.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    print("build context screen 1 : $context");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Simple Counter App",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    'Wi-Fi',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.red,
                        ),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.grey,
                        ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            const Divider(
              height: 5,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (_context, state) {
                if (state.wasIncremented) {
                  print("context in screen 1 : $context");
                  print("context in consumer 1 : $_context\n-----------");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Incremented in ${context.toString()}}"),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
              builder: (context, state) {
                return Text("${state.counter}",
                    style: Theme.of(context).textTheme.headline4);
              },
            ),
            const SizedBox(
              height: 40,
            ),

            Builder(
              builder: (context) {
                final style = Theme.of(context).textTheme.headline6;
                final connectivity = context.watch<InternetCubit>().state;
                final counter = context.watch<CounterCubit>().state;
                if(connectivity is InternetConnected && connectivity.connectionType == ConnectionType.wifi){
                  return Text("Counter : ${counter.counter}, internet : wifi", style: style,);
                }
                return Text("counter : ${counter.counter}, internet : Unknown", style: style,);
              }
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: FloatingActionButton(
                  heroTag: "1",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.exposure_minus_1),
                )),
                Expanded(
                    child: FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.add),
                )),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/screen2");
              },
              child: const Text("SECOND SCREEN"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, "/screen3");
              },
              child: Text("Third Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
