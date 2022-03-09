import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tes_state.dart';

class TesCubit extends Cubit<TesState> {
  TesCubit() : super(TesInitial());
}
