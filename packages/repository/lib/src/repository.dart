import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:afisha_api/afisha_api.dart';

class Repository {

  final ApiClient _apiClient = ApiClient();

  Future<String> loadApiKey() async {
    DateTime timeNow = new DateTime.now();
    int time = (timeNow.millisecondsSinceEpoch / 1000).round();
    final dateAdd = time.toString();
    final securyKey = "API.afisha7.ru$dateAdd";
    final hashValue = md5.convert(utf8.encode(securyKey)).toString();

    final keyResponse = await _apiClient.getAfisha7Key(
      securyKey: hashValue,
      dateAdd: dateAdd,
    );

    return keyResponse.APIKey;
  }

}