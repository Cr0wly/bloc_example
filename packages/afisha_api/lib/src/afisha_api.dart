import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/key.dart';

class RequestFailure implements Exception {}

class NotFoundFailure implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlAfisha7 = 'api.afisha7.ru';
  static const _Afisha7Version = 'v3.0';

  final http.Client _httpClient;

  Future<Afisha7KeyResponse> getAfisha7Key({
    required String securyKey,
    required String dateAdd,
  }) async {
    final url = Uri.https(_baseUrlAfisha7, '${_Afisha7Version}/getnewkey/');
    Map data = {
      'secury_key': '$securyKey',
      'date_add': '$dateAdd',
    };
    var dataEncode = json.decode('{"secury_key": "$securyKey", "date_add": "$dateAdd"}');

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    };

    final keyResponse = await _httpClient.post(url, headers: headers,
      body: dataEncode,
    );

    if (keyResponse.statusCode != 200) {
      throw RequestFailure();
    }

    final bodyJson = jsonDecode(keyResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('APIKey')) {
      throw NotFoundFailure();
    }

    return Afisha7KeyResponse.fromJson(bodyJson);
  }

}