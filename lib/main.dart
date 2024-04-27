import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/presentation/cubit/more_products_cubit.dart';
import 'app.dart';
import 'core/app_business_logic/app_cubit/app_cubit.dart';
import 'core/app_business_logic/bloc_observer.dart';
import 'core/app_utils/app_prefs.dart';
import 'core/dependency_injection/dependency_injection.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await configureDependencies();
  // await isarInit();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => getIt<AppCubit>()),
        BlocProvider<MoreProductsCubit>(create: (context) => getIt<MoreProductsCubit>()),

      ],
      child: App(preferences: getIt<AppPreferences>()),
    ), // Wrap your app
  );
}

// Future<void> isarInit() async {
//   await getIt<Isaar>().openObject(
//     schemas: [
//
//       // AppUsersDMSchema,
//
//     ],
//     name: 'Fawttara-database',
//   );
// }
//
// Future<void> isarClear() async {
//
//   // await getIt<Isaar>().clear<AppUsersDM>();
//
// }
