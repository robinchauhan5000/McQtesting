part of 'get_mcq_bloc.dart';

abstract class GetMcqEvent extends Equatable {
  const GetMcqEvent();
}

class McqLoadedEvent extends GetMcqEvent {
  @override
  List<Object> get props => [];
}
