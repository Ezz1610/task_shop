
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

  List<MoreProductDM>moreProductsDM=[];
  List<MoreProductDM>products=[];


  Future<void> getMoreProductsData({
    bool fromPagination=false,
    required authKey,
    required userId,

  })async {
    String homeTypes="new";
    String? authKey = getIt<AppPreferences>().userDataInfo!.authKey;
    String? userId = getIt<AppPreferences>().userDataInfo!.id;
    dPrint("itemCountNumber is before : ${_appPreference.itemCountValue}");
    String itemCount=getItemCount(_appPreference.itemCountValue);
    String limit="30";
    String searchWith="home_types";
    if(fromPagination){
      emit(PaginationLoadingState("PaginationLoadingState"));
    }else{
      emit(GetMoreProductLoadingState("loading"));

    }
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
      "accept": "application/json",};

    _moreProductsUseCase.execute(req).then((value) => value.fold(
            (failure) {
          dPrint("failure reqqqqqqqqqq is : ${failure.toString()}");
          emit(ErrorState(
              StateRendererType.toastErrorState, failure.message));
          },
            (data) {
          moreProductsDM = data!;
          moreProductsDM.map((e) => products.add(e)).toSet();
          if(data.isNotEmpty && data.length<29){
            _appPreference.itemCount=_appPreference.itemCountValue+30;

          }
          dPrint("itemCountNumber after is ${_appPreference.itemCountValue}");
          dPrint("data isssssssssssssliders${moreProductsDM.length.toString()}");

          _appPreference.remove(itemCount);
          if (moreProductsDM.isNotEmpty && fromPagination==false) {
            emit(SuccessState(
              message: 'success',
              stateRendererType: StateRendererType.contentState,
            ));
          } else if(fromPagination==true){
            emit(PaginationSuccessState('fromPagination',));
          }
          else {
            emit(EmptyState('لا يوجد منتجات '));
          }
          // print(data);
        }));
  }
  String getItemCount(int item){
    return "$item";
  }
}
