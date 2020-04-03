import 'package:prm_project/utils/secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final apiUrl = DotEnv().env['API_URL'];

class ApiCaller {
  post({String body, String route}) async {
    print('POST $apiUrl$route');
    String token = await getJwtToken();
    return http.post(
      '$apiUrl$route',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
  }

  put({String body, String route}) async {
    print('PUT $apiUrl$route');
    String token = await getJwtToken();
    return http.put(
      '$apiUrl$route',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
  }

  get({String route}) async {
    print('GET $apiUrl$route');
    String token = await getJwtToken();
    return http.get(
      '$apiUrl$route',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  patch({String route, dynamic body}) async {
    print('PATCH $apiUrl$route');
    String token = await getJwtToken();
    return http.patch(
      '$apiUrl$route',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
  }
}

final apiCaller = ApiCaller();
