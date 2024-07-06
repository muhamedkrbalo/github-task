import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/features/home/data/repos/home_repo_implents.dart';
import 'package:task_app/features/home/presentation/controller/home_provider.dart';
import 'package:task_app/features/home/presentation/screen/widgets/details_repo_list_view_widget.dart';
import 'package:task_app/features/search/presentation/screen/search_screen.dart';
import 'package:task_app/helpers/images/app_images.dart';
import 'package:task_app/helpers/theme/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:task_app/helpers/utils/navigator_methods.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllRepositoriesProvider(homeRepo:HomeRepoImpl())..getAllRepositories(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('GitHub Repo.',style: AppTextStyle.appBarStyle(context),),
          leading:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: SvgPicture.asset(AppImages.filterIcon,),
          ),
          actions: [InkWell(
            onTap:()=> NavigatorMethods.pushNamed(context, SearchScreen.routeName),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset(AppImages.searchIcon),
            ),
          ),],
          
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration:   BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                       const Color(0xFFD3DAF0).withOpacity(0.5),
                      const Color(0xFFD7C6E3).withOpacity(0.5),
                      const Color(0xFFD1C8D8).withOpacity(0.5),
                      const Color(0xFFEBC1A8).withOpacity(0.5), 
                        
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                 ) ,
                 child: Container(
                  margin:  EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                  padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:Consumer<AllRepositoriesProvider>(
                    builder: (BuildContext context, allRepositories, _) { 
                      if(allRepositories.state == ProviderState.loading){
                        return const Center(child: CircularProgressIndicator(),);
                      }else if (allRepositories.state == ProviderState.success) {
                        return  DetailsRepoListViewWidget(
                          allRepositories: allRepositories.allRepositories,
                        );
                      }else if (allRepositories.state == ProviderState.failure) {
                        return Center(child: Text(allRepositories.errorMessage?? 'An error occurred'),);
                      }else{  
                        return const Center(child: SizedBox(),);
                      }
                     },
                 ),
                 
                 )
        
                   ),
            ),
          ],
        ),
        floatingActionButton:  Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: (){
                Provider.of<AllRepositoriesProvider>(context,listen: false).getAllRepositories();
              },
              tooltip: 'Refresh',
              child: const Icon(Icons.refresh),
            );
          }
        ),
      
        ),
    );
        
}}
