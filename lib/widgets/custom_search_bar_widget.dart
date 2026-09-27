import 'package:flutter/material.dart';
import 'package:restaurant_api/screens/home/home_page_title.dart';
import 'package:restaurant_api/static/Sliver_header_delegate.dart';

class CustomSearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBarWidget({super.key, required this.onChanged});

  @override
  State<CustomSearchBarWidget> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.shade400,
                ),
                labelText: 'Cari Restoran',
                hintText: 'Cari berdasarkan nama atau lokasi...',
                suffixIcon: TextButton(
                  style: TextButton.styleFrom(overlayColor: Colors.transparent),
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged('');
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade600),
                  ),
                ),

                labelStyle: TextStyle(color: Colors.grey.shade600),
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                fillColor: Theme.of(context).canvasColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).hoverColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
