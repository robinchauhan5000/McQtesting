import 'dart:convert';

import 'package:http/http.dart';
import 'package:testing_dd/data/api/api_endpoint.dart';
import 'package:testing_dd/data/domain/mcq_domain.dart';
import 'package:testing_dd/data/models/mcq_model.dart';

class MCQRepo extends MCQDomain {
  @override
  Future<McqModel> getMCQ() async {
    try {
      final Response response = await get(
        Uri.parse('${ApiEndPoint.BaseUrl}${ApiEndPoint.getMCQ}'),
      );

      if (response.statusCode == 200) {
        print(response?.statusCode);
        final decoded = jsonDecode(response.body);
        McqModel data = McqModel.fromJson(decoded);
        return data;
      } else {
        throw Exception("Error accessing the MCQs API \nStatus Code: " +
            response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
  }
}
