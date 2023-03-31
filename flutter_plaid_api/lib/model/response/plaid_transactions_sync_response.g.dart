// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plaid_transactions_sync_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsSyncResponse _$TransactionsSyncResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionsSyncResponse(
      (json['added'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsSyncResponseToJson(
        TransactionsSyncResponse instance) =>
    <String, dynamic>{
      'added': instance.transactions,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      json['account_id'] as String?,
      (json['amount'] as num?)?.toDouble(),
      json['authorized_date'] as String?,
      (json['category'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['name'] as String?,
      json['payment_channel'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'amount': instance.amount,
      'authorized_date': instance.authorizedDate,
      'category': instance.category,
      'name': instance.merchantName,
      'payment_channel': instance.paymentChannel,
    };
