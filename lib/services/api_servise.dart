import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class ApiServices {
  static Future<List<Model>> getapi() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    return modelFromJson(response.body);
  }
}
