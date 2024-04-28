
import 'dart:math';

import 'package:task/core/app_business_logic/state_renderer/state_renderer.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/presentation/screens/account/account_screen.dart';
import 'package:task/features/home/presentation/screens/categories/categories_screen.dart';
import 'package:task/features/home/presentation/screens/favorite/favorite_screen.dart';
import 'package:task/features/home/presentation/screens/home/home_screen.dart';
import 'package:task/features/home/presentation/screens/settings/settings_screen.dart';
import '../../../../core/app_business_logic/state_renderer/state_renderer_impl.dart';
import '../../../../core/app_utils/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/home_usecase.dart';

@injectable
class HomeCubit extends Cubit<FlowState> {
  final HomeUseCase _homeUseCase;
  final AppPreferences _appPreference;
  HomeCubit( this._appPreference,this._homeUseCase) : super(ContentState());

  static HomeCubit get(BuildContext context) => context.read<HomeCubit>();

  HomeDM? homeModel;

  Future<void> getHomeData({
    required authKey,
    required userId
  })async {
    String? authKey = getIt<AppPreferences>().userDataInfo!.authKey;
    String? userId = getIt<AppPreferences>().userDataInfo!.id;
    emit(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    var req = HomeDataRequest(
        authKey!,
        userId!

    );
    dPrint("authKey is : ${req.authKey.toString()}");
    dPrint("userId is : ${req.userId.toString()}");
    _homeUseCase.execute(req).then((value) => value.fold(
            (failure) {
          dPrint("failure reqqqqqqqqqq is : ${failure.toString()}");
          emit(ErrorState(StateRendererType.toastErrorState, failure.message));
        },
            (data) {
          homeModel = data;

          dPrint("data isssssssssssssliders${homeModel!.sliders.toString()}");
          dPrint("data issssssssssssproducts${homeModel!.products.toString()}");


          emit(SuccessState(
            message: 'تم حفظ البيانات بنجاح',
            stateRendererType: StateRendererType.contentState,
          ));
          // print(data);
        }));
  }
  int currentIndex=0;
  void changeIndex(int index)
  {
    currentIndex=index;
    emit(ContentState(randomInt: Random().nextInt(1000)));
  }
  List<Widget>screens=[
     HomeScreen(),
    const SettingsScreen(),
    CartScreen(),
    FavoritScreen(),
    const AccountScreen()

  ];

}
