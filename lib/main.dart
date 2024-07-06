import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/features/home/presentation/screen/home_screen.dart';
import 'package:task_app/helpers/routes/app_routers.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task App',
         builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouters.onGenerateRoute,
        navigatorKey: AppRouters.navigatorKey,
        theme: ThemeData(
        ),
       
      ),
    );
  }
}

