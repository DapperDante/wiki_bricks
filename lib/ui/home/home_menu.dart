import 'package:flutter/material.dart';
import 'home_view_model.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key, required this.viewModel});
  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) => Text('home');
}
