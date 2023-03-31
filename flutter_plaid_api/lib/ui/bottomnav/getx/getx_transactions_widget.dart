import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:plaid_poc/ui/bottomnav/getx/bottom_nav_controller.dart';

import '../transaction_card.dart';

class GetXTransactionsWidget extends StatelessWidget {
  const GetXTransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();
    controller.getTransactions();

    return Obx(
        ()=> ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          itemCount: controller.transactions.length,
          itemBuilder: (BuildContext context, int index) {
            final transaction = controller.transactions[index];

            return TransactionCard(
              transaction: transaction,
            );
          },
        ),
    );
  }
}
