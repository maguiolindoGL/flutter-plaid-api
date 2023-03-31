import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plaid_poc/ui/bottomnav/riverpod/riverpod_transaction_notifier.dart';

import '../transaction_card.dart';

class RiverpodTransactionsWidget extends ConsumerWidget {
  const RiverpodTransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(transactionsProvider.notifier).getTransactions();
    final state = ref.watch(transactionsProvider);

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        height: 1,
      ),
      itemCount: state.transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final transaction = state.transactions[index];

        return TransactionCard(
          transaction: transaction,
        );
      },
    );
  }
}

// class RiverpodTransactionsWidget extends ConsumerStatefulWidget {
//   const RiverpodTransactionsWidget({super.key});
//
//   @override
//   ConsumerState createState() => _RiverpodTransactionsWidgetState();
// }
//
// class _RiverpodTransactionsWidgetState extends ConsumerState {
//
//   @override
//   void initState() {
//     super.initState();
//
//     final notifier = ref.read(transactionsProvider.notifier);
//     notifier.getTransactions();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(transactionsProvider);
//
//     return ListView.separated(
//       separatorBuilder: (BuildContext context, int index) =>
//       const Divider(
//         color: Colors.grey,
//         height: 1,
//       ),
//       itemCount: state.transactions.length,
//       itemBuilder: (BuildContext context, int index) {
//         final transaction = state.transactions[index];
//
//         return TransactionCard(
//           transaction: transaction,
//         );
//       },
//     );
//   }
// }
