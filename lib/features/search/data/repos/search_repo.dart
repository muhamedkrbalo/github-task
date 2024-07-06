import 'package:dartz/dartz.dart';
import 'package:task_app/features/search/data/model/all_repositories_search_model.dart';
import 'package:task_app/helpers/error/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<AllRepositoriesSearchModel>>> getAllRepositoriesSearch({ required String textSearch});
}