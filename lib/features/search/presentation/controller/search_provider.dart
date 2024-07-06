import 'package:flutter/material.dart';
import 'package:task_app/features/search/data/model/all_repositories_search_model.dart';
import 'package:task_app/features/search/data/repos/search_repo.dart';

enum ProviderSearchState { loading, success, failure }

class AllRepositoriesSearchProvider extends ChangeNotifier {
    final SearchRepo searchRepo;
  AllRepositoriesSearchProvider({required this.searchRepo});


  ProviderSearchState? _state ;
  ProviderSearchState? get state => _state;

  String? errorMessage;
  List<AllRepositoriesSearchModel> _allRepositoriesSearch= [];
  List<AllRepositoriesSearchModel> get allRepositoriesSearch => _allRepositoriesSearch;

  Future<void> getAllRepositoriesSearch({required String textSearch}) async {
    try {
      _state = ProviderSearchState.loading;
      _allRepositoriesSearch = [];
      notifyListeners();
      final result = await searchRepo.getAllRepositoriesSearch(textSearch: textSearch);
      result.fold((failure) {
        _state = ProviderSearchState.failure;
        errorMessage = failure.errMessage;
         notifyListeners();
      }, (r) {
        _allRepositoriesSearch = r; 
        _state = ProviderSearchState.success;
         notifyListeners();
      });
    } catch (e) {
      _state = ProviderSearchState.failure;
      errorMessage = 'An error occurred';
    } finally {
      notifyListeners();
    }
  }
}