import 'package:equatable/equatable.dart';

class BottomNavBlocState extends Equatable {
  const BottomNavBlocState({
    List<String>? accounts,
    this.sideEffect,
  }) : accounts = accounts ?? const [];

  final List<String> accounts;
  final BottomNavBlocSideEffect? sideEffect;

  @override
  List<Object?> get props => [
        accounts,
        sideEffect,
      ];

  BottomNavBlocState copyWith({
    List<String>? accounts,
    BottomNavBlocSideEffect? sideEffect,
  }) {
    return BottomNavBlocState(
      accounts: accounts ?? this.accounts,
      sideEffect: sideEffect,
    );
  }
}

abstract class BottomNavBlocSideEffect {}

class StartPlaidLogin extends BottomNavBlocSideEffect {
  StartPlaidLogin(this.linkToken);

  String linkToken;
}
