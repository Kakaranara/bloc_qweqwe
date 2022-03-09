// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_qweqwe/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_qweqwe/main.dart';

void main() {
  group("Testing purpose", (){
    CounterCubit? counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });
    tearDown((){
      counterCubit!.close();
    });
    
    test("harusnya 0", (){
      expect(counterCubit!.state, CounterState(counter: 0));
    });
    
  });
}