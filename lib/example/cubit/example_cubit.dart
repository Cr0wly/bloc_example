import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit({
    required Repository repository
  }) : _repository = repository,
        super(const ExampleState());

  final Repository _repository;

  Future<void> fetchKey() async {
    await Future.delayed(const Duration(seconds: 10));

    emit(state.copyWith(status: ExampleStatus.loading));

    final key = await _repository.loadApiKey();

    emit(
      state.copyWith(
        status: ExampleStatus.success,
        key: key,
      ),
    );
  }
}