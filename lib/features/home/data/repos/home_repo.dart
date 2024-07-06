import 'package:dartz/dartz.dart';
import 'package:task_app/features/home/data/model/all_repositories_model.dart';
import 'package:task_app/helpers/error/failures.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<AllRepositoriesModel>>> getAllRepositories();
}