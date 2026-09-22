// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_api/providers/search_bar/search_bar_provider.dart';

// class CustomSearchBar extends StatelessWidget {
//   const CustomSearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SearchBar(
//       onChanged: (value) {
//         context.read<SearchBarProvider>().setQuery(value);
//       },
//       trailing: [
//         IconButton(
//           onPressed: () {
//             context.read<SearchBarProvider>().clear();
//           },
//           icon: Icon(Icons.clear),
//         ),
//       ],
//     );
//   }
// }
