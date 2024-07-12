import 'package:flutter/foundation.dart';
import 'package:quran_app/model/quran_model.dart';
import 'package:quran_app/networking/api_services.dart';

class ApiProvider with ChangeNotifier {
  final List<Quran> _filteredList = [];
  List<Quran> _surahslist = [];

  List<Quran> _allSurahsCombine = [];
  List<Quran> get allSurahsCombine => _allSurahsCombine;

  String _searchString = '';
  bool isLoading = true;
  List<Quran> get surahslist => _surahslist;
  List<Quran> get filteredList => _filteredList;

  getcompleteQuran() async {
    final data = await ApiServices().getData();
    _allSurahsCombine = data;
    notifyListeners();
  }

  getSurahs() async {
    isLoading;
    notifyListeners();
    final data = await ApiServices().getData();
    _surahslist = data;
    isLoading = false;
    notifyListeners();
    getFilterList();
    notifyListeners();
  }

  getFilterList() {
    _filteredList.clear();
    if (_searchString.isEmpty) {
      _filteredList.addAll(surahslist);
      notifyListeners();
    } else {
      _filteredList.addAll(_surahslist
          .where((surah) =>
              surah.englishName.toLowerCase().contains(_searchString))
          .toList());

      notifyListeners();
    }
  }

  search(String searchText) {
    _searchString = searchText;
    if (kDebugMode) {
      print(_searchString);
    }
    notifyListeners();
    getFilterList();
  }
}
