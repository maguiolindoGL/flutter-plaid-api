// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plaid_create_link_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLinkTokenResponse _$CreateLinkTokenResponseFromJson(
        Map<String, dynamic> json) =>
    CreateLinkTokenResponse(
      json['link_token'] as String,
      json['expiration'] as String,
    );

Map<String, dynamic> _$CreateLinkTokenResponseToJson(
        CreateLinkTokenResponse instance) =>
    <String, dynamic>{
      'link_token': instance.linkToken,
      'expiration': instance.expiration,
    };
