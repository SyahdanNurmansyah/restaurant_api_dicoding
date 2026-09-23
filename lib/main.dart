import 'package:flutter/material.dart';
import 'package:restaurant_api/screens/detail/detail_screen.dart';
import 'package:restaurant_api/screens/home/home_screen.dart';
import 'package:restaurant_api/static/navigator_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: NavigatorRoutes.mainRoute.name,
      routes: {
        NavigatorRoutes.mainRoute.name: (context) => const HomeScreen(),
        NavigatorRoutes.detailRoute.name: (context) => DetailScreen(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
