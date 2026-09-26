import 'package:flutter/material.dart';

class CustomerReviewForm extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomerReviewForm({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        children: [
          TextFormField(
            maxLines: maxLines,
            controller: controller,
            validator: validator,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              labelText: label,
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
        ],
      ),
    );
  }
}
