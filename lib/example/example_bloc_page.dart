import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import 'bloc/example_bloc.dart';

class ExampleBlocPage extends StatelessWidget {
  const ExampleBlocPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExampleBloc(
        repository: context.read<Repository>(),
      )..add(FetchKey()),
      child: const ExampleBlocView(),
    );
  }
}


class ExampleBlocView extends StatelessWidget {
  const ExampleBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Container(
        color: Colors.white,
        child:
          Column(
          children: [
            const Text("Реализация bloc"),
            const SizedBox(height: 20,),
            BlocBuilder<ExampleBloc, ExampleState>(
              builder: (context, state) {
                if (state.status == ExampleStatus.initial) {
                  return const Text("initial");
                } else if (state.status == ExampleStatus.loading) {
                  return const Text("loading");
                } else if (state.status == ExampleStatus.success) {
                  return Text(state.key ?? "key is null");
                } else if (state.status == ExampleStatus.failure) {
                  return const Text("failure");
                } else {
                  return Container();
                }
              }
            ),
          ]
        ),
      ),
    );
  }
}