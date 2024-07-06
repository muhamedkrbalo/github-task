import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_app/custom_widget/custom_form_filed/custom_form_field.dart';
import 'package:task_app/features/search/data/repos/search_repo_implents.dart';
import 'package:task_app/features/search/presentation/controller/search_provider.dart';
import 'package:task_app/features/search/presentation/screen/widgets/details_repo_list_view_search_widget.dart';
import 'package:task_app/helpers/images/app_images.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = 'SearchScreen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => AllRepositoriesSearchProvider(searchRepo: SearchRepoImpl()),
          child: Consumer<AllRepositoriesSearchProvider>(
            builder: (BuildContext context, allRepositoriesSearch, _) => Column(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: CustomFormField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppImages.searchIcon),
                    ),
                    hintText: 'Search',
                    onChanged: (value) {
                      if(value.isNotEmpty){
                        context.read<AllRepositoriesSearchProvider>().getAllRepositoriesSearch(textSearch: value);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
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
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          if (allRepositoriesSearch.state == ProviderSearchState.loading)
                            const Center(child: CircularProgressIndicator())
                          else if (allRepositoriesSearch.state == ProviderSearchState.success)
                            Expanded(
                              child: DetailsRepoListViewSearchWidget(
                                allRepositoriesSearch: allRepositoriesSearch.allRepositoriesSearch,
                              ),
                            )
                          else if (allRepositoriesSearch.state == ProviderSearchState.failure)
                            Center(child: Text(allRepositoriesSearch.errorMessage ?? 'An error occurred'))
                          else
                            const Center(child: Text('Search for a repository')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
