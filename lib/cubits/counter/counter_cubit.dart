import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initState());

  // 상태를 변경하여 stream 에 추가( emit )하는 메서드 구현
  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
