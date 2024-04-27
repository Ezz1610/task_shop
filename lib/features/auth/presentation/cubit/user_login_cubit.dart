import 'dart:math';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task/core/app_business_logic/enums.dart';
import 'package:task/features/auth/domain/model/user_data_login_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../../core/app_business_logic/state_renderer/state_renderer.dart';
import '../../../../core/app_business_logic/state_renderer/state_renderer_impl.dart';
import '../../../../core/app_utils/app_prefs.dart';
import '../../../../core/app_utils/media_query_values.dart';
import '../../data/request/user_info_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/user_login_usecase.dart';
import 'package:package_info_plus/package_info_plus.dart';

@injectable
class UserLogInCubit extends Cubit<FlowState> {
  final UserLogInUseCase _userAuthUseCase;
  final AppPreferences _appPreference;
  UserLogInCubit(this._userAuthUseCase, this._appPreference) : super(ContentState());

  static UserLogInCubit get(BuildContext context) => context.read<UserLogInCubit>();
  UserLoginDataDM? userLoginDataDM;

  Future<void> getUserLoginDataInfo({
    required email,
    required password,
  })async {
    String deviceId = await getDeviceId();
    String platform = getPlatform();
    String token =await setupFirebaseMessaging();
    emit(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    var req = UserLoginDataInfoRequest(
         email,
         password,
         token,
         deviceId,
         platform

    );
    _userAuthUseCase.execute(req).then((value) => value.fold(
            (failure) {
          dPrint("failure reqqqqqqqqqq is : ${failure.toString()}");
          emit(ErrorState(StateRendererType.toastErrorState, failure.message));
        }, (data) {
      userLoginDataDM = data;

      dPrint("data issssssssssss${userLoginDataDM!.email.toString()}");

      _appPreference.userDataInfo = data!;
          dPrint("ttttttttttttttttttt${_appPreference.token}");
          emit(SuccessState(
            message: 'تم تسجيل المستخدم',
            stateRendererType: StateRendererType.contentState,
          ));
          // print(data);
        }));
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  changePasswordVisibility() {
    isPassword = !isPassword;
    dPrint(isPassword.toString());
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ContentState(randomInt: Random().nextInt(1000)));
  }
  Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';
    if (Platform.isAndroid) {
      // for Android devices
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id ?? '';
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    }
    return deviceId;
  }
  String getPlatform() {
    if (Platform.isAndroid) {
      // Code specific to Android
      dPrint('Running on Android');
      return "1";
    } else if (Platform.isIOS) {
      // Code specific to iOS (iPhone, iPad, iPod touch)
      dPrint('Running on iOS');
      return "2";

    }else {
      // Code for other platforms
      dPrint('Running on an unknown platform');

      return "unknown platform";
    }
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> setupFirebaseMessaging() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    return token??"";
    print('FCM Token: $token');
    // Use the token in your authentication request
  }



  // initialFunction()async{
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   FirebaseMessaging.instance.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: true,
  //     criticalAlert: false,
  //     provisional: true,
  //     sound: true,
  //   );
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true, // Required to display a heads up notification
  //     badge: true,
  //     sound: true,
  //   );
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     // حنبقي نرجع نقول هنا حاجه البوشت الجاي خليك فاكر//
  //   });
  //
  //   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   // // ودي مهمه جدااااا
  //   // @pragma('vm:entry-point')
  //   // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   // print('Message data: ${message.data}');
  //   // }
  //   // FirebaseMessaging.onMessageOpenedApp.listen(_firebaseMessageOpenAppHandler);
  //   //
  //   // @pragma('vm:entry-point')
  //   // Future<void> _firebaseMessageOpenAppHandler(RemoteMessage message) async {
  //   //   print('Handling click on message : ${message.messageId}');
  //   //   // حننفذ هنا اللوجك الي عاوزين نعمله لو التطبيق كان مقفول ولما داس علي النوتيفيكيشن فتح التطبيق زي انا يروح لاسكرينه معينه وهكذا
  //   // }
  //
  //
  // }

}
