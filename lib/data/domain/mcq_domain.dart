import 'package:testing_dd/data/models/mcq_model.dart';

abstract class MCQDomain {
  Future<McqModel> getMCQ();
}
