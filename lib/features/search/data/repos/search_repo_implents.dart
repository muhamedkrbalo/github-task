import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_app/features/search/data/model/all_repositories_search_model.dart';
import 'package:task_app/features/search/data/repos/search_repo.dart';
import 'package:task_app/helpers/error/failures.dart';
import 'package:task_app/helpers/networking/api_helper.dart';
import 'package:task_app/helpers/networking/urls.dart';

class SearchRepoImpl extends SearchRepo{
  SearchRepoImpl();

  @override
 Future<Either<Failure,List<AllRepositoriesSearchModel>>> getAllRepositoriesSearch({
  required String textSearch
 })async {
try{
  var data = await ApiHelper.instance.get(Urls.searchRepositories,queryParameters: {
    'q':textSearch
  });
 List<AllRepositoriesSearchModel> allRepositoriesSearchInfo = allRepositoriesSearch(data);
 return right(allRepositoriesSearchInfo);
  
}catch(e){
   if(e is DioException){
     return left(ServerFailure.fromDioError(e));
}
  return left(ServerFailure(e.toString()));

}}}

      List<AllRepositoriesSearchModel> allRepositoriesSearch(data) {
        List<AllRepositoriesSearchModel> repositoriesSearch=[];
        for(var allRepositoriesMap in data['items']){
         repositoriesSearch.add(AllRepositoriesSearchModel.fromJson(allRepositoriesMap));
        }
        return repositoriesSearch;
      }


 
  
