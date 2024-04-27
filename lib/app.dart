import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sizer/sizer.dart';
import 'app_routes.dart';
import 'core/app_business_logic/app_cubit/app_cubit.dart';
import 'core/app_utils/app_prefs.dart';
import 'splash_screen.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  final AppPreferences preferences;
  static late BuildContext appContext;
  static late AppLocalizations tr;
  static late AppCubit appCubit;

  const App({Key? key, required this.preferences}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive) {}
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocBuilder<AppCubit, AppState>(
        buildWhen: (previousState, currentState) =>
        previousState != currentState,
        builder: (context, state) {
          App.appCubit = context.watch<AppCubit>();
          return MaterialApp(
            navigatorKey: appNavigatorKey,
            navigatorObservers: [
              // getIt<FirebaseAnalyticsService>().appAnalyticsObserver()
            ],
            onGenerateTitle: (context) {
              systemOverLay();
              App.appContext = context;
              App.tr = AppLocalizations.of(context)!;
              return App.tr.appName;
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: App.appCubit.locale,
            theme: App.appCubit.theme,
            // home: const StartServerScreen(),
            initialRoute: SplashScreen.id,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      );
    });
  }
}

void systemOverLay() {
  return SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark // status bar color
  ));
}
