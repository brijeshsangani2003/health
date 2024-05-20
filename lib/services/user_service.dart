import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class GetApiService {
  static Future<List<Model>> apiservice() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    return modelFromJson(response.body);
  }
}
