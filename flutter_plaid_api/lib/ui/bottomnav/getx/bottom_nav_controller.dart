import 'package:get/state_manager.dart';
import 'package:plaid_poc/model/response/plaid_transactions_sync_response.dart';
import 'package:plaid_poc/model/transaction_ui_model.dart';

import '../../../data/plaid_repository.dart';
import '../../../network/network_result.dart';

class BottomNavController extends GetxController {
  final transactions = <TransactionUiModel>[].obs;

  void getTransactions() async {
    var getTransactionsSyncResponse = await getTransactionsSync();

    if (getTransactionsSyncResponse is ResultSuccess) {
      final data = getTransactionsSyncResponse.data;

      if (data is TransactionsSyncResponse) {
        transactions.value =
            data.transactions.map((e) => e.toUiModel()).toList();
      }
    } else if (getTransactionsSyncResponse is ResultError) {
      // show custom or general error
    } else {
      // show general error
    }
  }
}
