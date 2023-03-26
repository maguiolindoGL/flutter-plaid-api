import 'package:json_annotation/json_annotation.dart';

part 'plaid_create_link_token_response.g.dart';

@JsonSerializable()
class CreateLinkTokenResponse {
  CreateLinkTokenResponse(this.linkToken, this.expiration);

  @JsonKey(name: 'link_token')
  final String linkToken;

  final String expiration;

  factory CreateLinkTokenResponse.fromJson(Map<String, dynamic> json) => _$CreateLinkTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLinkTokenResponseToJson(this);
}