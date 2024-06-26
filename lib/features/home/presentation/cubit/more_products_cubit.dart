
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:task/core/app_business_logic/state_renderer/state_renderer.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/data/request/more_products_data_request.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';
import 'package:task/features/home/domain/usecase/more_products_usecase.dart';
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
class MoreProductsCubit extends Cubit<FlowState> {
  final MoreProductsUseCase _moreProductsUseCase;
  final AppPreferences _appPreference;
  MoreProductsCubit( this._appPreference,this._moreProductsUseCase) : super(ContentState());

  static MoreProductsCubit get(BuildContext context) => context.read<MoreProductsCubit>();

  MoreProductsDM? moreProductsDM;
  List<MoreProductDM>products=[];


  Future<void> getMoreProductsData({
    required authKey,
    required userId,

  })async {
    String homeTypes="new";
    int itemCountNumber=0;
    String? authKey = getIt<AppPreferences>().userDataInfo!.authKey;
    String? userId = getIt<AppPreferences>().userDataInfo!.id;
    String itemCount=getItemCount(itemCountNumber);
    String limit="30";
    String searchWith="home_types";
    emit(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    var req = MoreProductsDataRequest(
        authKey!,
        userId!,
      searchWith,
      homeTypes,
        itemCount,
      limit,




    );
    getIt<Dio>().options.headers={  "Accept-Language":"en",
      "content-type": "application/json",
      "accept": "application/json",};  //I/flutter (15149): {auth_key: xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468,
    // user_id: 16, search_with: home_types, home_types: 30, item_count: new, limit: 0}
    dPrint("authKey is : ${req.authKey.toString()}");
    dPrint("userId is : ${req.userId.toString()}");
    _moreProductsUseCase.execute(req).then((value) => value.fold(
            (failure) {
          dPrint("failure reqqqqqqqqqq is : ${failure.toString()}");
          emit(ErrorState(StateRendererType.toastErrorState, failure.message));
        },
            (data) {
          moreProductsDM = data;
          moreProductsDM!.moreProducts?.map((e) => products.add(e)).toSet();
          itemCountNumber+=30;
          dPrint("data isssssssssssssliders${moreProductsDM!.moreProducts!.length.toString()}");


          emit(SuccessState(
            message: 'تم حفظ البيانات بنجاح',
            stateRendererType: StateRendererType.contentState,
          ));
          // print(data);
        }));
  }
String getItemCount(int itemCount){
    return "$itemCount";
}
}
