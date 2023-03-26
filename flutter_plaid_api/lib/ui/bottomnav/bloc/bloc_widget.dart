import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc_state.dart';

class BLoCWidget extends StatelessWidget {
  const BLoCWidget({
    Key? key,
    required this.bottomNavBloc,
  }) : super(key: key);

  final BottomNavBloc bottomNavBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBloc>(
      create: (context) => bottomNavBloc,
      child: BlocBuilder<BottomNavBloc, BottomNavBlocState>(
        builder: (context, state) {
          print(state.accounts);
          return Placeholder();
        },
      ),
    );
  }
}
