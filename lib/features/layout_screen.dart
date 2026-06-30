import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required this._navigationShell});
  final StatefulNavigationShell _navigationShell;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Layout Shell')),
    body: _navigationShell,
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _navigationShell.currentIndex,
      onTap: (index) => _navigationShell.goBranch(
        index,
        initialLocation: index == _navigationShell.currentIndex,
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Sets'),
        BottomNavigationBarItem(icon: Icon(Icons.toys), label: 'Minifigs'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: () {},
      child: const Icon(Icons.search, color: Colors.white),
    ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}
