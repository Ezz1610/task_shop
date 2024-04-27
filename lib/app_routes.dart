
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/features/home/presentation/screens/main_screen.dart';
import 'package:task/features/home/presentation/screens/more_products_screen/more_products_screen.dart';
import 'package:task/features/home/presentation/screens/search/search_screen.dart';
import 'features/auth/presentation/screens/user_login_screen.dart';
import 'splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {


      case UserLoginScreen.id:
        return MaterialPageRoute(builder: (context) {
          return const UserLoginScreen();
        });
      case MainScreen.id:
        return MaterialPageRoute(builder: (context) {

          return const MainScreen();
        });
        case SearchScreen.id:
        return MaterialPageRoute(builder: (context) {

          return const SearchScreen();
        });
        case MoreProductScreen.id:
        return MaterialPageRoute(builder: (context) {

          return const MoreProductScreen();
        });

      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) {
          dPrint("test44444444444444");
          return const SplashScreen();
        });

      default:
        return undefinedRoute();
    }
  }

  static Route? onUnknownRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreen.id:
        return MaterialPageRoute(builder: (context) {
          return   const MainScreen();
        });
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
