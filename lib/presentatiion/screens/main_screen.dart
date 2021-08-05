import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_dd/presentatiion/bloc/get_mcq_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetMcqBloc>().add(McqLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetMcqBloc, GetMcqState>(
        listener: (context, state) {
          if (state is McqErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is McqFetchedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  state.mcqModel.message,
                  style: TextStyle(fontSize: 20),
                ))
              ],
            );
          }

          return Text('error');
        },
      ),
    );
  }
}
