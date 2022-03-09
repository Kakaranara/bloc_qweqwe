import 'dart:developer';

import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:bloc_qweqwe/presentation/screen/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                // Navigator.of(context).pushNamed("/screen2");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<CounterCubit>(context),
                              child: Screen2(
                                  title: "Screen2", color: Colors.amberAccent),
                            )));
              },
              child: const Text("SECOND SCREEN"),
            ),
            const SizedBox(height: 20,),
            MaterialButton(onPressed: (){
              Navigator.pushNamed(context, "/screen3");
            },
            child: Text("Third Screen"),),
          ],
        ),
      ),
    );
  }
}
