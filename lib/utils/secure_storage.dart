import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:prm_project/models/user_details.dart';

// Create storage
final flutterSecureStorage = new FlutterSecureStorage();
final jwtTokenName = 'jwtToken';

void setJwtToken(token) {
  flutterSecureStorage.write(key: jwtTokenName, value: token);
}

Future<String> getJwtToken() {
  return flutterSecureStorage.read(key: jwtTokenName);
}

Future<void> deleteAllFromSecureStorage() async {
  await flutterSecureStorage.deleteAll();
}

Future<UserDetails> getUserFromToken() async {
  String token = await getJwtToken();
  if (token != null) {
    final userJson = parseJwt(token);
    return UserDetails.fromJson(userJson);
  }
  return null;
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
