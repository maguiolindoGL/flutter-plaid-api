import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plaid_poc/common/constant.dart';
import 'package:plaid_poc/model/response/plaid_create_link_token_response.dart';
import 'package:plaid_poc/network/network_result.dart';

import '../network/config.dart';

Future<NetworkResult> plaidCreateLinkToken() async {
  try {
    final body = jsonEncode({
      "client_id": plaidClientId,
      "secret": plaidSecretKey,
      "client_name": "Flutter POC Plaid",
      "country_codes": ["US"],
      "language": "en",
      "user": {"client_user_id": "unique_user_id"},
      "products": ["auth"]
    });

    final response = await http.post(
      Uri.parse('$baseUrl/link/token/create'),
      headers: defaultHeaders,
      body: body,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      var createLinkTokenResponse = CreateLinkTokenResponse.fromJson(responseMap);
      return ResultSuccess(data: createLinkTokenResponse);
    } else {
      return ResultError(data: response.reasonPhrase);
    }

  } catch (e) {
    return ResultException(data: e);
  }
}
