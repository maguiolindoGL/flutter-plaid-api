import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plaid_poc/common/plaid_properties.dart';
import 'package:plaid_poc/model/response/plaid_transactions_sync_response.dart';
import 'package:plaid_poc/ui/bottomnav/riverpod/riverpod_transaction_provider_state.dart';

import '../../../data/plaid_repository.dart';
import '../../../model/transaction_ui_model.dart';

class StateTransactionNotifier extends StateNotifier<TransactionProviderState> {
  // We initialize the list of todos to an empty list
  StateTransactionNotifier()
      : super(
          const TransactionProviderState(
            transactions: [],
          ),
        );

  void getTransactions() async {
    final transactionSyncResponse = await getTransactionsSync();
    final data = transactionSyncResponse.data;

    if (data is TransactionsSyncResponse) {
      final transactions = data.transactions.map((e) => e.toUiModel());
      state = state.copyWith(transactions: transactions.toList());
    }
  }
}

final transactionsProvider =
    StateNotifierProvider<StateTransactionNotifier, TransactionProviderState>((
  ref,
) {
  return StateTransactionNotifier();
});
