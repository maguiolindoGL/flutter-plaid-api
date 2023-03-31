import 'package:equatable/equatable.dart';
import 'package:plaid_poc/model/transaction_ui_model.dart';

class BottomNavBlocState extends Equatable {
  const BottomNavBlocState({
    List<TransactionUiModel>? transactions,
    this.sideEffect,
  }) : transactions = transactions ?? const [];

  final List<TransactionUiModel> transactions;
  final BottomNavBlocSideEffect? sideEffect;

  @override
  List<Object?> get props => [
        transactions,
        sideEffect,
      ];

  BottomNavBlocState copyWith({
    List<TransactionUiModel>? transactions,
    BottomNavBlocSideEffect? sideEffect,
  }) {
    return BottomNavBlocState(
      transactions: transactions,
      sideEffect: sideEffect,
    );
  }
}

abstract class BottomNavBlocSideEffect {}

class StartPlaidLogin extends BottomNavBlocSideEffect {
  StartPlaidLogin(this.linkToken);

  String linkToken;
}
