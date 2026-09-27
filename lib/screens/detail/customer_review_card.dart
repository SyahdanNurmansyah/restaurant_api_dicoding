import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';
import 'package:restaurant_api/providers/feature/customer_review_provider.dart';
import 'package:restaurant_api/screens/detail/customer_review_form_widget.dart';
import 'package:restaurant_api/static/customer_review_result_state.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

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
            Consumer<CustomerReviewProvider>(
              builder: (context, value, child) {
                final reviewCount = switch (value.resultState) {
                  CustomerReviewLoadedState(id: var id, data: var data)
                      when id == widget.restaurantDetail.id =>
                    data.customerReviews.length,
                  _ => widget.restaurantDetail.customerReviews.length,
                };
                return Text('$reviewCount Ulasan');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: const Divider(thickness: 0.5),
            ),
            Consumer<CustomerReviewProvider>(
              builder: (context, value, child) {
                final reviews = switch (value.resultState) {
                  CustomerReviewLoadedState(id: var id, data: var data)
                      when id == widget.restaurantDetail.id =>
                    data.customerReviews,
                  _ => widget.restaurantDetail.customerReviews,
                };
                return SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: reviews.map((review) {
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
                );
              },
            ),
            const SizedBox(height: 12),
            CustomerReviewFormWidget(
              nameController: _nameController,
              reviewController: _reviewController,
              widget: widget,
            ),
          ],
        ),
      ),
    );
  }
}
