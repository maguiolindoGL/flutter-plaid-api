import 'package:plaid_poc/common/constant.dart';
import 'package:plaid_poc/model/response/plaid_transactions_sync_response.dart';

class TransactionUiModel {
  TransactionUiModel({
    this.accountId = emptyString,
    this.amount = zeroDouble,
    this.authorizedDate = emptyString,
    this.category = const [],
    this.merchantName = emptyString,
    this.paymentChannel = emptyString,
  });

  String accountId;

  double amount;

  String authorizedDate;

  List<String> category;

  String merchantName;

  String paymentChannel;
}

extension TransactionExtension on Transaction {
  TransactionUiModel toUiModel() => TransactionUiModel(
        accountId: accountId ?? emptyString,
        amount: amount ?? zeroDouble,
        authorizedDate: authorizedDate ?? emptyString,
        category: category ?? [],
        merchantName: merchantName ?? emptyString,
        paymentChannel: paymentChannel ?? emptyString,
      );
}

