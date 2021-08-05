import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_dd/data/models/mcq_model.dart';
import 'package:testing_dd/data/repositories/mcq_repo.dart';

part 'get_mcq_event.dart';
part 'get_mcq_state.dart';

class GetMcqBloc extends Bloc<GetMcqEvent, GetMcqState> {
  GetMcqBloc({this.mcqRepo}) : super(GetMcqInitial());

  final MCQRepo mcqRepo;
  @override
  Stream<GetMcqState> mapEventToState(
    GetMcqEvent event,
  ) async* {
    if (event is McqLoadedEvent) {
      yield McqFetchingState();
      try {
        McqModel data = await mcqRepo.getMCQ();
        yield McqFetchedState(mcqModel: data);
      } catch (error) {
        yield McqErrorState(error: error.toString());
      }
    }
  }
}
