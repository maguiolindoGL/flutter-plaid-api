import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/transaction_card.dart';
import 'package:plaid_poc/ui/bottomnav/bloc/bottom_nav_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/bloc/bottom_nav_bloc_state.dart';

class BLoCTransactionsWidget extends StatelessWidget {
  const BLoCTransactionsWidget({
    Key? key,
    required this.bottomNavBloc,
  }) : super(key: key);

  final BottomNavBloc bottomNavBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavBlocState>(
        bloc: bottomNavBloc,
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
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
        });
  }
}
