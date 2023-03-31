import 'package:flutter/material.dart';
import 'package:plaid_poc/common/size.dart';
import 'package:plaid_poc/model/transaction_ui_model.dart';

import '../../common/style.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionUiModel transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        size_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.merchantName,
            style: body1,
          ),
          Text(
            transaction.amount.toString(),
            style: body1,
          ),
          Text(
            transaction.authorizedDate,
            style: body1,
          ),
        ],
      ),
    );
  }
}
