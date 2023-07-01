import 'package:bloc_example/example/example_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import 'example/example_bloc_page.dart';

void main() {
  final repository = Repository();
  
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.repository
  });

  final Repository repository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExampleCubitPage(),
        //home: const ExampleBlocPage(),
      ),
    );
  }
}
