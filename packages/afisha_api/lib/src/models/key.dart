import 'package:json_annotation/json_annotation.dart';

part 'key.g.dart';

@JsonSerializable()
class Afisha7KeyResponse {
  const Afisha7KeyResponse({
    required this.id,
    required this.APIKey,
  });

  factory Afisha7KeyResponse.fromJson(Map<String, dynamic> json) =>
      _$Afisha7KeyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Afisha7KeyResponseToJson(this);

  final int id;
  final String APIKey;
}