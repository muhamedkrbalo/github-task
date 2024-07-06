import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/helpers/theme/app_colors.dart';





class AppTextStyle {
  AppTextStyle(TextStyle textD14R);

  static TextStyle appBarStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.appBarTextColor,
      fontFamily: 'Inter'
    );
  }

  static TextStyle text14DarkSemiBold(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.darkColor,
      fontFamily: 'Inter'
    );
  }

  static TextStyle text14DarkRegular(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.darkColor,
      fontFamily: 'Inter'
    );
  } 
  static TextStyle text10DarkRegular(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.darkColor.withOpacity(.80),
      fontFamily: 'Inter'
    );
  }
  static TextStyle text12BlueRegular(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.blue,
      fontFamily: 'Inter'
    );
  }

  static TextStyle buttonStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.whiteColor
    );
  }

 

  static TextStyle textFormStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
    fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.darkColor,
      fontFamily: 'Inter'
    
    );
  }

  static TextStyle formTitleStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
     fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.darkColor,
      fontFamily: 'Inter'
    
    );
  }
}