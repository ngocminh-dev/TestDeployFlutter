import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return PopScope(child: _buildNavigator(context));
  }

  Widget _buildNavigator(BuildContext context) {
    return Container();
  }
}
