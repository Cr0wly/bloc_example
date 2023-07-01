import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import 'cubit/example_cubit.dart';

class ExampleCubitPage extends StatelessWidget {
  const ExampleCubitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExampleCubit(
        repository: context.read<Repository>(),
      )..fetchKey(),
      child: const ExampleCubitView(),
    );
  }
}


class ExampleCubitView extends StatelessWidget {
  const ExampleCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Container(
        color: Colors.white,
        child:
          Column(
          children: [
            const Text("Реализация cubit"),
            const SizedBox(height: 20,),
            BlocConsumer<ExampleCubit, ExampleState>(
              listener: (context, state) {
                log(state.status.toString());
              },
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