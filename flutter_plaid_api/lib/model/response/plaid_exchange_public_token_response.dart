import 'package:json_annotation/json_annotation.dart';

part 'plaid_exchange_public_token_response.g.dart';

@JsonSerializable()
class ExchangePublicTokenResponse {
  ExchangePublicTokenResponse(this.accessToken);

  @JsonKey(name: 'access_token')
  final String accessToken;

  factory ExchangePublicTokenResponse.fromJson(Map<String, dynamic> json) => _$ExchangePublicTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangePublicTokenResponseToJson(this);
}