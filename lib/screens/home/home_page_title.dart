import 'package:flutter/material.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 32),
      child: Text.rich(
        TextSpan(
          text: 'Temukan ',
          style: TextStyle(
            // color: Theme.of(context).dividerColor,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
            height: 1.2,
          ),

          children: [
            TextSpan(
              text: ' Restoran ',
              style: TextStyle(
                color: Colors.green,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                height: 1.2,
              ),
            ),

            TextSpan(
              text: 'terdekat dan nyaman.',
              style: TextStyle(
                // color: Colors.grey,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                height: 1.2,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
