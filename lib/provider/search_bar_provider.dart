import 'package:flutter/material.dart';

class SearchBarProvider with ChangeNotifier {
  bool _showSearchField = false;

  bool get showSearchField => _showSearchField;

  toggleSearh() {
    if (_showSearchField == false) {
      _showSearchField = true;
      notifyListeners();
    } else {
      _showSearchField = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
