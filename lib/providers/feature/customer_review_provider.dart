import 'package:flutter/widgets.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/static/customer_review_result_state.dart';

class CustomerReviewProvider extends ChangeNotifier {
  final ApiServices _apiServices;
  CustomerReviewProvider(this._apiServices);

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
        _resultState = CustomerReviewLoadedState(result);
      }
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () {
        _resultState = CustomerReviewNoneState();
        notifyListeners();
      });
    } on Exception catch (e) {
      debugPrint('POST REVIEW GAGAL: $e');
      _resultState = CustomerReviewErrorState(e.toString());
      notifyListeners();
    }
  }
}
