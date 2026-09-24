import 'package:flutter/material.dart';

class CustomerReviewForm extends StatefulWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController _controller;
  final String? Function(String?)? validator;

  const CustomerReviewForm({
    super.key,
    required this.label,
    required this.hint,
    required this._controller,
    this.validator,
    required this.maxLines,
  });

  @override
  State<CustomerReviewForm> createState() => _CustomerReviewFormState();
}

class _CustomerReviewFormState extends State<CustomerReviewForm> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        children: [
          TextFormField(
            maxLines: widget.maxLines,
            controller: _controller,
            validator: widget.validator,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: widget.hint,
              labelText: widget.label,
              labelStyle: TextStyle(color: Colors.grey.shade600),
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              filled: true,
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
