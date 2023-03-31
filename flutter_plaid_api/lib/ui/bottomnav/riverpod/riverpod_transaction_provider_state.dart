import 'package:flutter/cupertino.dart';
import 'package:plaid_poc/model/transaction_ui_model.dart';

@immutable
class TransactionProviderState {
  const TransactionProviderState({
    required this.transactions,
  });

  final List<TransactionUiModel> transactions;

  TransactionProviderState copyWith({
    List<TransactionUiModel>? transactions,
  }) {
    return TransactionProviderState(
      transactions: transactions ?? this.transactions,
    );
  }
}
