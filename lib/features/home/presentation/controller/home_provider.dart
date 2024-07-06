import 'package:flutter/material.dart';
import 'package:task_app/features/home/data/model/all_repositories_model.dart';
import 'package:task_app/features/home/data/repos/home_repo.dart';

enum ProviderState { loading, success, failure }

class AllRepositoriesProvider extends ChangeNotifier {
    final HomeRepo homeRepo;
  AllRepositoriesProvider({required this.homeRepo});


  ProviderState _state = ProviderState.loading;
  ProviderState get state => _state;

  String? errorMessage;
  List<AllRepositoriesModel> _allRepositories= [];
  List<AllRepositoriesModel> get allRepositories => _allRepositories;

  Future<void> getAllRepositories() async {
    try {
      _state = ProviderState.loading;
      _allRepositories = [];
      notifyListeners();
      final result = await homeRepo.getAllRepositories();
      result.fold((failure) {
        _state = ProviderState.failure;
        errorMessage = failure.errMessage;
         notifyListeners();
      }, (r) {
        _allRepositories = r; 
        _state = ProviderState.success;
         notifyListeners();
      });
    } catch (e) {
      _state = ProviderState.failure;
      errorMessage = 'An error occurred';
    } finally {
      notifyListeners();
    }
  }
}