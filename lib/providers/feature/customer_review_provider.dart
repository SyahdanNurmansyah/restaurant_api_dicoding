import 'package:flutter/widgets.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/models/customer_review.dart';
import 'package:restaurant_api/static/customer_review_result_state.dart';

class CustomerReviewProvider extends ChangeNotifier {
  final ApiServices _apiServices;
  CustomerReviewProvider(this._apiServices);

  final Map<String, List<CustomerReview>> _reviews = {};
  List<CustomerReview>? getReviews(String id) {
    return _reviews[id];
  }

  CustomerReviewResultState _resultState = CustomerReviewNoneState();
  CustomerReviewResultState get resultState => _resultState;

  Future<void> fetchPostReview(String id, String name, String review) async {
    debugPrint('POST REVIEW DIMULAI');
    debugPrint('id: $id');
    debugPrint('name: $name');
    debugPrint('review: $review');
    try {
      _resultState = CustomerReviewLoadingState();
      notifyListeners();

      final result = await _apiServices.postReview(id, name, review);

      debugPrint('POST REVIEW BERHASIL');
      debugPrint('message: ${result.message}');
      debugPrint('jumlah review: ${result.customerReviews}');

      if (result.error) {
        _resultState = CustomerReviewErrorState(result.message);
      } else {
        _reviews[id] = result.customerReviews;
        _resultState = CustomerReviewLoadedState(id, result);
      }
      notifyListeners();
    } on Exception catch (e) {
      debugPrint('POST REVIEW GAGAL: $e');
      _resultState = CustomerReviewErrorState(e.toString());
      notifyListeners();
    }
  }
}
