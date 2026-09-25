import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';
import 'package:restaurant_api/providers/feature/customer_review_provider.dart';
import 'package:restaurant_api/static/customer_review_result_state.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';
import 'package:restaurant_api/widgets/customer_review_form.dart';

class CustomerReviewCard extends StatefulWidget {
  final RestaurantDetail restaurantDetail;
  const CustomerReviewCard({super.key, required this.restaurantDetail});

  @override
  State<CustomerReviewCard> createState() => _CustomerReviewCardState();
}

class _CustomerReviewCardState extends State<CustomerReviewCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Customer Review', style: RestaurantTextStyles.titleMedium),
            Text('${widget.restaurantDetail.customerReviews.length} Ulasan'),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: const Divider(thickness: 0.5),
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: widget.restaurantDetail.customerReviews.map((
                    review,
                  ) {
                    return SizedBox(
                      width: double.infinity,
                      child: Card(
                        shadowColor: Colors.transparent,
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Text(
                                    review.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),

                                  Row(
                                    children: List.generate(5, (index) {
                                      if (widget.restaurantDetail.rating >=
                                          index + 1) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14,
                                        );
                                      } else if (widget
                                              .restaurantDetail
                                              .rating >
                                          index) {
                                        return const Icon(
                                          Icons.star_half,
                                          color: Colors.amber,
                                          size: 14,
                                        );
                                      } else {
                                        return const Icon(
                                          Icons.star_border,
                                          color: Colors.amber,
                                          size: 14,
                                        );
                                      }
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(review.review),

                              const SizedBox(height: 4),
                              Text(
                                review.date,
                                style: TextStyle(
                                  color: Theme.of(context).dividerColor,

                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Consumer<CustomerReviewProvider>(
                builder: (context, value, child) {
                  return switch (value.resultState) {
                    CustomerReviewLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    CustomerReviewErrorState(error: var error) => Text(error),

                    CustomerReviewLoadedState() => Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Beri Ulasan',
                          style: RestaurantTextStyles.titleMedium,
                        ),
                        Text('Harap input nama Anda dan deskripsi.'),
                        const SizedBox(height: 8),
                        CustomerReviewForm(
                          label: 'Nama Pelanggan',
                          hint: 'Mul Yhono',
                          controller: _nameController,
                          maxLines: 1,
                        ),
                        CustomerReviewForm(
                          label: 'Deskripsi',
                          hint: 'Sudah tapi belum ke sini',
                          controller: _reviewController,
                          maxLines: 4,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    CustomerReviewNoneState() => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        onPressed: switch (value.resultState) {
                          CustomerReviewLoadingState() => null,
                          _ => () {
                            context
                                .read<CustomerReviewProvider>()
                                .fetchPostReview(
                                  widget.restaurantDetail.id,
                                  _nameController.text,
                                  _reviewController.text,
                                );
                          },
                        },

                        child: const Text('Kirim Feedback'),
                      ),
                    ),
                  };
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16),
            //   child: Column(
            //     crossAxisAlignment: .start,
            //     children: [
            //       Text('Beri Ulasan', style: RestaurantTextStyles.titleMedium),
            //       Text('Harap input nama Anda dan deskripsi.'),
            //       const SizedBox(height: 8),
            //       CustomerReviewForm(
            //         label: 'Nama Pelanggan',
            //         hint: 'Mul Yhono',
            //         controller: _controller,
            //         maxLines: 1,
            //       ),
            //       CustomerReviewForm(
            //         label: 'Deskripsi',
            //         hint: 'Sudah tapi belum ke sini',
            //         controller: _controller,
            //         maxLines: 4,
            //       ),
            //       const SizedBox(height: 8),
            //       SizedBox(
            //         width: double.infinity,
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             padding: const EdgeInsets.symmetric(vertical: 12),
            //             shadowColor: Colors.transparent,
            //             backgroundColor: Colors.green,
            //             foregroundColor: Colors.white,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12),
            //             ),
            //           ),

            //           onPressed: () {},
            //           child: Text('Kirim Feedback'),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
