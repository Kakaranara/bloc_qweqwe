import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  // CounterCubit() : super(CounterInitial());
  //
  // void decrement() => emit(CounterInitial().decrement());
  // void increment() => emit(CounterInitial().increment());

  CounterCubit() : super(CounterState(counter: 0));

  void increment() => emit(CounterState(counter: state.counter + 1 ));
  void decrement() => emit(CounterState(counter: state.counter - 1, wasIncremented: false ));
}
