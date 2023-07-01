part of 'example_cubit.dart';

enum ExampleStatus { initial, loading, success, failure }

class ExampleState extends Equatable {
  const ExampleState({
    this.status = ExampleStatus.initial,
    this.key,
  });

  final ExampleStatus status;
  final String? key;

  ExampleState copyWith({
    ExampleStatus? status,
    String? key,
  }) {
    return ExampleState(
      status: status ?? this.status,
      key: key ?? this.key,
    );
  }

  @override
  List<Object?> get props => [status, key];
}