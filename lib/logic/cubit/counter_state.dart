part of 'counter_cubit.dart';

// abstract class CounterState{
//   CounterState({required this.counter, this.wasIncremented = true});
//   int counter;
//   bool wasIncremented;
//
//   increment(){
//     this.counter += 1;
//   }
//
//   decrement(){
//     counter -= 1;
//   }
// }
//
// class CounterInitial extends CounterState{
//   CounterInitial() : super(counter: 0);
// }

class CounterState{
  CounterState({required this.counter, this.wasIncremented = true});

  bool wasIncremented;
  int counter;


}