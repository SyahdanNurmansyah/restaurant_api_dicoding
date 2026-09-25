import 'package:flutter/material.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class Headers extends StatefulWidget {
  const new({super.key});

  @override
  State<Headers> createState() => _HeadersState();
}

class _HeadersState extends State<Headers> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Row(
                spacing: 12,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(Icons.restaurant_menu, size: 18),
                    ),
                  ),

                  Flexible(
                    child: Column(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .start,

                      children: [
                        Text(
                          'Halo,',
                          style: RestaurantTextStyles.bodyLargeMedium,
                        ),
                        Text(
                          'Syahdan Nurmansyah',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
          ],
        ),
      ),
    );
  }
}
