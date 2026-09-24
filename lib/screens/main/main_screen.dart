import 'package:flutter/material.dart';
import 'package:restaurant_api/screens/home/headers.dart';
import 'package:restaurant_api/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: Headers()),
          // SliverToBoxAdapter(child: HomeScreen()),
        ],
      ),
    );
  }
}
