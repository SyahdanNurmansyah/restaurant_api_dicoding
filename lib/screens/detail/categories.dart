// import 'package:flutter/material.dart';
// import 'package:restaurant_api/models/restaurant_detail.dart';

// class CategoriesCard extends StatelessWidget {
//   final RestaurantDetail restaurant;
//   const CategoriesCard({super.key, required this.restaurant});

//   @override
//   Widget build(BuildContext context) {
//     final category = [
//       ...restaurant.categories.map((cateogry) => cateogry.name),
//     ];
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: category.length,
//       itemBuilder: (context, index) {
//         final categories = category[index];

//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           child: Text(
//             categories,
//             style: TextStyle(color: Colors.white, fontSize: 8),
//           ),
//         );
//       },
//     );
//   }
// }
