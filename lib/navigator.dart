import 'package:task/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:task/features/home/presentation/screens/main_screen.dart';

GlobalKey<NavigatorState> menuKey = GlobalKey<NavigatorState>();

class MenuNavigator extends StatefulWidget {
  const MenuNavigator({Key? key}) : super(key: key);

  @override
  _MenuNavigatorState createState() => _MenuNavigatorState();
}

class _MenuNavigatorState extends State<MenuNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: menuKey,
        initialRoute: MainScreen.id,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        onUnknownRoute: AppRoutes.onUnknownRoute);
  }
}

void mainScreenNavigator({required String screen, Object? arg}) {
  menuKey.currentState!
      .pushNamedAndRemoveUntil(screen, (route) => false, arguments: arg);
}
