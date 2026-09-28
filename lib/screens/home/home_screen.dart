import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/providers/home/restaurant_list_provider.dart';
import 'package:restaurant_api/screens/home/headers.dart';
import 'package:restaurant_api/screens/home/home_page_title.dart';
import 'package:restaurant_api/screens/home/restaurant_list_screen.dart';
import 'package:restaurant_api/static/Sliver_header_delegate.dart';
import 'package:restaurant_api/widgets/custom_search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Headers()),

          SliverToBoxAdapter(child: HomePageTitle()),
          _customSearchBar(),
          SliverToBoxAdapter(child: RestaurantListScreen()),
        ],
      ),
    );
  }

  SliverPersistentHeader _customSearchBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        child: CustomSearchBarWidget(onChanged: (value) {}),
        minHeight: 60,
        maxHeight: 60,
      ),
    );
  }
}
