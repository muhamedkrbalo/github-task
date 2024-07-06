import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/features/home/data/model/all_repositories_model.dart';
import 'package:task_app/features/home/data/repos/home_repo.dart';
import 'package:task_app/helpers/error/failures.dart';
import 'package:task_app/helpers/networking/api_helper.dart';
import 'package:task_app/helpers/networking/urls.dart';

class HomeRepoImpl extends HomeRepo{
  HomeRepoImpl();

  @override
 Future<Either<Failure,List<AllRepositoriesModel>>> getAllRepositories()async {
try{
  var data = await ApiHelper.instance.get(Urls.repositories);
 List<AllRepositoriesModel> allRepositoriesInfo = allRepositories(data);
 return right(allRepositoriesInfo);
  
}catch(e){
   if(e is DioException){
     return left(ServerFailure.fromDioError(e));
}
  return left(ServerFailure(e.toString()));

}}}

      List<AllRepositoriesModel> allRepositories(data) {
        List<AllRepositoriesModel> repositories=[];
        for(var allRepositoriesMap in data){
         repositories.add(AllRepositoriesModel.fromJson(allRepositoriesMap));
        }
        return repositories;
      }


 
  
