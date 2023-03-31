import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'plaid_transactions_sync_response.g.dart';

@JsonSerializable()
class TransactionsSyncResponse {
  TransactionsSyncResponse(this.transactions);

  @JsonKey(name: 'added')
  final List<Transaction> transactions;

  factory TransactionsSyncResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsSyncResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsSyncResponseToJson(this);
}

@JsonSerializable()
class Transaction {
  const Transaction(
    this.accountId,
    this.amount,
    this.authorizedDate,
    this.category,
    this.merchantName,
    this.paymentChannel,
  );

  @JsonKey(name: 'account_id')
  final String? accountId;

  final double? amount;

  @JsonKey(name: 'authorized_date')
  final String? authorizedDate;

  final List<String>? category;

  @JsonKey(name: 'name')
  final String? merchantName;

  @JsonKey(name: 'payment_channel')
  final String? paymentChannel;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
