import 'package:restaurant_api/static/customer_review_request.dart';

sealed class CustomerReviewResultState {}

class CustomerReviewNoneState extends CustomerReviewResultState {}

class CustomerReviewLoadingState extends CustomerReviewResultState {}

class CustomerReviewErrorState extends CustomerReviewResultState {
  final String error;
  CustomerReviewErrorState(this.error);
}

class CustomerReviewLoadedState extends CustomerReviewResultState {
  final CustomerReviewRequest data;
  CustomerReviewLoadedState(this.data);
}
