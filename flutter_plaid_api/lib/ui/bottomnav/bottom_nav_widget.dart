import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:plaid_poc/ui/bottomnav/bloc/bloc_widget.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc_event.dart';
import 'package:plaid_poc/ui/bottomnav/bottom_nav_bloc_state.dart';
import 'package:plaid_poc/ui/bottomnav/riverpod/riverpod_widget.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _selectedIndex = 0;
  late BottomNavBloc _bottomNavBloc;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();

    _bottomNavBloc = BottomNavBloc();
    _bottomNavBloc.add(
      InitScreenEvent(),
    );

    _widgetOptions = <Widget>[
      BLoCWidget(bottomNavBloc: _bottomNavBloc),
      const RiverpodWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBloc>(
      create: (context) => _bottomNavBloc,
      child: BlocListener<BottomNavBloc, BottomNavBlocState>(
        listener: (context, state) {
          final sideEffect = state.sideEffect;

          if (sideEffect is StartPlaidLogin) {
            // LinkConfiguration configuration = LinkTokenConfiguration(
            //   token: sideEffect.linkToken,
            // );
            //
            // PlaidLink.open(configuration: configuration);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plaid Example'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'BLoC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Riverpod',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _bottomNavBloc.close();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
