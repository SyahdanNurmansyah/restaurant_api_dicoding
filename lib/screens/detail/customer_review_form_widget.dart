import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/providers/feature/customer_review_provider.dart';
import 'package:restaurant_api/screens/detail/customer_review_card.dart';
import 'package:restaurant_api/static/customer_review_result_state.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';
import 'package:restaurant_api/widgets/customer_review_form.dart';

class CustomerReviewFormWidget extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _reviewController;
  final CustomerReviewCard widget;

  const CustomerReviewFormWidget({
    super.key,
    required this._nameController,
    required this._reviewController,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),

      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Beri Ulasan', style: RestaurantTextStyles.titleMedium),
          Text('Harap input nama Anda dan deskripsi.'),
          const SizedBox(height: 8),
          CustomerReviewForm(
            label: 'Nama Anda',
            hint: 'Mul Yhono',
            controller: _nameController,
            maxLines: 1,
          ),
          CustomerReviewForm(
            label: 'Deskripsi',
            hint: 'Tempat recommended untuk melamun...',
            controller: _reviewController,
            maxLines: 4,
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              onPressed: () {
                debugPrint('TOMBOL DIKLIK');

                final id = widget.restaurantDetail.id;
                final name = _nameController.text;
                final review = _reviewController.text;

                debugPrint('ID: $id');
                debugPrint('NAME: $name');
                debugPrint('REVIEW: $review');
                context.read<CustomerReviewProvider>().fetchPostReview(
                  id,
                  name,
                  review,
                );
              },
              child: Text('Kirim Feedback'),
            ),
          ),
          const SizedBox(height: 8),

          Consumer<CustomerReviewProvider>(
            builder: (context, value, child) {
              return switch (value.resultState) {
                CustomerReviewLoadingState() => Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),

                CustomerReviewErrorState(error: var message) => Text(message),
                CustomerReviewLoadedState(:final data) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(data.message),
                ),
                _ => const SizedBox(),
              };
            },
          ),
        ],
      ),
    );
  }
}
