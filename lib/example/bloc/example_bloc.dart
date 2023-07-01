import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

part 'example_state.dart';
part 'example_event.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({
    required Repository repository
  }) : _repository = repository,
        super(const ExampleState()) {
    on<FetchKey>((event, emit) async {
        await _printLog(event, emit);
        await _onFetchKey(event, emit);
      }
    );
  }

  final Repository _repository;

  Future<void> _onFetchKey(
      FetchKey event,
      Emitter<ExampleState> emit,
  ) async {
    emit(state.copyWith(status: ExampleStatus.loading));
    final key = await _repository.loadApiKey();

    emit(
      state.copyWith(
        status: ExampleStatus.success,
        key: key,
      ),
    );
  }

  Future<void> _printLog(
    FetchKey event,
    Emitter<ExampleState> emit,
  ) async {
    log('FetchKey event handled');
  }

}