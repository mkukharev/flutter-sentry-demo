import 'package:flutter/foundation.dart';

class LoadingModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void startLoading() {
    Future.delayed(Duration.zero, () {
      if (!_isLoading) {
        _isLoading = true;
        notifyListeners();
      }
    });
  }

  void finishLoading() {
    Future.delayed(Duration.zero, () {
      if (_isLoading) {
        _isLoading = false;
        notifyListeners();
      }
    });
  }
}
