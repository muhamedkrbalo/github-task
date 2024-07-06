import 'package:flutter/material.dart';
import 'package:task_app/features/home/presentation/screen/home_screen.dart';
import 'package:task_app/features/search/presentation/screen/search_screen.dart';


class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
     
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  const HomeScreen(),
        );
        case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  const SearchScreen(),
        );
       default:
        return null;
    }
  }
}
