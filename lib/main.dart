import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_dd/presentatiion/bloc/get_mcq_bloc.dart';
import 'package:testing_dd/presentatiion/screens/main_screen.dart';

import 'data/repositories/mcq_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MCQRepo(),
      child: BlocProvider(
        create: (mcqContext) =>
            GetMcqBloc(mcqRepo: RepositoryProvider.of<MCQRepo>(mcqContext)),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}
