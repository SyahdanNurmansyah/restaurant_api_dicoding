import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/providers/detail/restaurant_detail_provider.dart';
import 'package:restaurant_api/providers/feature/customer_review_provider.dart';
import 'package:restaurant_api/providers/home/restaurant_list_provider.dart';
import 'package:restaurant_api/providers/home/theme_icon_provider.dart';
import 'package:restaurant_api/screens/detail/detail_screen.dart';
import 'package:restaurant_api/screens/home/home_screen.dart';
import 'package:restaurant_api/static/navigator_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantDetailProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CustomerReviewProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(create: (context) => RestaurantThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<RestaurantThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.green,
        //   brightness: Brightness.light,
        // ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.green,
        //   brightness: Brightness.dark,
        // ),
      ),

      themeMode: themeProvider.themeMode,
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
