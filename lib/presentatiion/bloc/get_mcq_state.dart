part of 'get_mcq_bloc.dart';

abstract class GetMcqState extends Equatable {
  const GetMcqState();
  @override
  List<Object> get props => [];
}

class GetMcqInitial extends GetMcqState {
  @override
  List<Object> get props => [];
}

class McqFetchingState extends GetMcqState {}

class McqFetchedState extends GetMcqState {
  McqModel mcqModel;

  McqFetchedState({this.mcqModel});

  @override
  List<Object> get props => [mcqModel];
}

class McqErrorState extends GetMcqState {
  final String error;

  McqErrorState({this.error});
}
