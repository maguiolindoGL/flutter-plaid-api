import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plaid_poc/ui/bottomnav/bloc/bloc_transactions_widget.dart';
import 'package:plaid_poc/ui/bottomnav/bloc/bottom_nav_bloc.dart';
import 'package:plaid_poc/ui/bottomnav/getx/getx_transactions_widget.dart';
import 'package:plaid_poc/ui/bottomnav/riverpod/riverpod_transactions_widget.dart';

import 'bloc/bottom_nav_bloc_event.dart';
import 'getx/bottom_nav_controller.dart';

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
      BLoCTransactionsWidget(bottomNavBloc: _bottomNavBloc),
      const ProviderScope(
        child: RiverpodTransactionsWidget(),
      ),
      const GetXTransactionsWidget()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'GetX',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
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
