// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _1;
import 'package:injectable/injectable.dart' as _2;
import 'package:task/features/home/domain/usecase/more_products_usecase.dart'as _30;


import 'dio_module.dart' as _3;
import 'di_module.dart' as _4;
import 'package:dio/dio.dart' as _5;
import 'package:task/features/home/presentation/cubit/home_cubit.dart'as _6;

import 'package:internet_connection_checker/internet_connection_checker.dart' as _7;
import 'package:shared_preferences/shared_preferences.dart' as _8;
import 'package:task/core/app_utils/app_prefs.dart'as _9;
import 'package:task/features/home/domain/usecase/home_usecase.dart' as _10;
import 'package:task/features/home/domain/repository/home_repository.dart' as _11;


import 'package:task/core/data/network/save_api.dart' as _13;
import 'package:task/core/data/network/network_info.dart' as _16;
import 'package:task/features/home/data/repository_impl/home_repository_impl.dart' as _17;

import 'package:task/features/home/data/data_source/home_remote_data_source.dart' as _18;
import 'package:task/features/home/domain/usecase/home_usecase.dart' as _19;
import 'package:task/features/home/data/mappers/home_mapper/home_data_mapper.dart' as _20;
import 'package:task/features/home/data/mappers/products_mapper/product_mapper.dart' as _21;
import 'package:task/features/home/data/mappers/sliders_mapper/slider_mapper.dart' as _22;
import 'package:task/features/home/data/mappers/new_products_mapper/new_product_mapper.dart' as _23;
import 'package:task/features/home/data/mappers/selected_products_mapper/selected_product_mapper.dart' as _24;
import 'package:task/features/home/data/mappers/categories_mapper/category_mapper.dart' as _25;
import 'package:task/features/home/data/mappers/more_products_mapper/more_products_mapper.dart' as _26;
import 'package:task/features/home/data/mappers/more_product_mapper/more_product_mapper.dart' as _27;
import 'package:task/features/home/presentation/cubit/more_products_cubit.dart'as _28;
import 'package:task/features/home/domain/usecase/more_products_usecase.dart'as _29;
// initializes the registration of main-scope dependencies inside of GetIt
Future<_1.GetIt> $initGetIt(
  _1.GetIt getIt, {
  String? environment,
  _2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dIModule = _$DIModule();
  final dioModule = _$DioModule();
  await gh.factoryAsync<_5.Dio>(
        () => dioModule.getDio(),
    preResolve: true,
  );


  gh.factory<_7.InternetConnectionChecker>(() => dIModule.connectionChecker);
  gh.factory<_6.HomeCubit>(() => _6.HomeCubit(
    gh<_9.AppPreferences>(),
    gh<_19.HomeUseCase>(),
  ));
  gh.factory<_28.MoreProductsCubit>(() => _28.MoreProductsCubit(
    gh<_9.AppPreferences>(),
    gh<_29.MoreProductsUseCase>(),
  ));

gh.factory<_9.AppPreferences>(() => _9.AppPreferences(
  gh<_8.SharedPreferences>(),


));
  gh.factory<_19.HomeUseCase>(() => _19.HomeUseCase(
    gh<_11.HomeRepository>(),
  ));
  gh.factory<_30.MoreProductsUseCase>(() => _30.MoreProductsUseCase(
    gh<_11.HomeRepository>(),
  ));

gh.factory<_16.NetworkInfo>(() => _16.NetworkInfoImpl(
 gh<_7.InternetConnectionChecker>(),
));
gh.factory<_13.SafeApi>(() => _13.SafeApi(
  gh<_16.NetworkInfo>(),
));


gh.factory<_11.HomeRepository>(() => _17.HomeRepositoryImpl(
gh<_13.SafeApi>(),
gh<_18.HomeRemoteDataSource>(),
gh<_20.HomeMapper>(),
gh<_26.MoreProductsMapper>(),


));
  gh.factory<_20.HomeMapper>(() =>_20.HomeMapper(
    gh<_21.ProductMapper>(),
    gh<_22.SliderMapper>(),
    gh<_23.NewProductMapper>(),
    gh<_24.SelectedProductMapper>(),
    gh<_25.CategoryMapper>(),

  ));
  gh.factory<_21.ProductMapper>(() =>_21.ProductMapper(
  ));
  gh.factory<_22.SliderMapper>(() =>_22.SliderMapper(
  ));
  gh.factory<_23.NewProductMapper>(() =>_23.NewProductMapper(
  ));
 gh.factory<_24.SelectedProductMapper>(() =>_24.SelectedProductMapper(
  ));
 gh.factory<_25.CategoryMapper>(() =>_25.CategoryMapper(
  ));
 gh.factory<_26.MoreProductsMapper>(() =>_26.MoreProductsMapper(
   gh<_27.MoreProductMapper>(),

 ));
 gh.factory<_27.MoreProductMapper>(() =>_27.MoreProductMapper(
  ));

  // final ProductMapper _productMapper;
  // final SliderMapper _sliderMapper;
  // final NewProductMapper _newProductMapper;
  // final SelectedProductMapper _selectedProductMapper;
  // final CategoryMapper _categoryMapper;



  await gh.factoryAsync<_8.SharedPreferences>(
    () => dIModule.prefs,
    preResolve: true,
  );

  return getIt;
}

class _$DIModule extends _4.DIModule {}

class _$DioModule extends _3.DioModule {}
