import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/custom_widget/custom_image/custom_network_image.dart';
import 'package:task_app/features/home/data/model/all_repositories_model.dart';
import 'package:task_app/helpers/images/app_images.dart';
import 'package:task_app/helpers/theme/app_colors.dart';
import 'package:task_app/helpers/theme/app_text_style.dart';

class DetailsRepoListViewWidget extends StatelessWidget {
  final List<AllRepositoriesModel> allRepositories;
  const DetailsRepoListViewWidget({
    super.key, required this.allRepositories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 50.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: CustomNetworkImage(
                            width: 26.w,
                            height: 26.h,
                            imageUrl:allRepositories[index].owner?.avatarUrl??"",
                          ),
                        )),
                    SizedBox(
                      width: 14.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Name: ${allRepositories[index].name??''}',
                            style: AppTextStyle.text14DarkSemiBold(context)
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Expanded(child: Text('Owner: ${allRepositories[index].owner?.login??''}',style: AppTextStyle.text14DarkRegular(context),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                               SizedBox(width: 5.w,),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.blue.withOpacity(.16),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.w),
                                child:  Text(
                                  '12/10/2023',
                                  style: AppTextStyle.text12BlueRegular(context)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                 SizedBox(height: 4.h),
                 Row(
                  children: [
                    Text('Main Branch: Main',style: AppTextStyle.text10DarkRegular(context),),
                     SizedBox(width: 9.w),
                   SvgPicture.asset(AppImages.copyIcon)
                  ],
                ),
              ],
            ),
        separatorBuilder: (context, index) =>
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 7.h),
              child: const Divider(color: Colors.white,thickness: 2,),
            ),
        itemCount: allRepositories.length);
  }
}
