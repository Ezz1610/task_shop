// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i27;
import '../../features/auth/data/mappers/user_data_login_mapper.dart' as _i15;
import '../../features/auth/data/network/auth_api.dart' as _i21;
import '../../features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i29;
import '../../features/auth/domain/model/user_data_login_model.dart' as _i14;
import '../../features/auth/domain/repository/auth_repository.dart' as _i28;
import '../../features/auth/domain/usecase/user_login_usecase.dart' as _i32;
import '../../features/auth/presentation/cubit/user_login_cubit.dart' as _i33;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i22;
import '../../features/home/data/mappers/categories_mapper/category_mapper.dart'
    as _i4;
import '../../features/home/data/mappers/home_mapper/home_data_mapper.dart'
    as _i18;
import '../../features/home/data/mappers/more_product_mapper/more_product_mapper.dart'
    as _i6;
import '../../features/home/data/mappers/new_products_mapper/new_product_mapper.dart'
    as _i8;
import '../../features/home/data/mappers/products_mapper/product_mapper.dart'
    as _i9;
import '../../features/home/data/mappers/selected_products_mapper/selected_product_mapper.dart'
    as _i11;
import '../../features/home/data/mappers/sliders_mapper/slider_mapper.dart'
    as _i13;
import '../../features/home/data/network/home_api.dart' as _i19;
import '../../features/home/data/repository_impl/home_repository_impl.dart'
    as _i24;
import '../../features/home/domain/repository/home_repository.dart' as _i23;
import '../../features/home/domain/usecase/home_usecase.dart' as _i25;
import '../../features/home/domain/usecase/more_products_usecase.dart' as _i26;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i30;
import '../../features/home/presentation/cubit/more_products_cubit.dart'
    as _i31;
import '../app_business_logic/app_cubit/app_cubit.dart' as _i20;
import '../app_utils/app_prefs.dart' as _i16;
import '../data/mapper/base_response_mapper.dart' as _i3;
import '../data/network/network_info.dart' as _i7;
import '../data/network/save_api.dart' as _i10;
import 'module/di_module.dart' as _i34;
import 'module/dio_module.dart' as _i35;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dIModule = _$DIModule();
  final dioModule = _$DioModule();
  gh.factory<_i3.BaseResponseMapper>(() => _i3.BaseResponseMapper());
  gh.factory<_i4.CategoryMapper>(() => _i4.CategoryMapper());
  gh.factory<_i5.InternetConnectionChecker>(() => dIModule.connectionChecker);
  gh.factory<_i6.MoreProductMapper>(() => _i6.MoreProductMapper());
  gh.factory<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
  gh.factory<_i8.NewProductMapper>(() => _i8.NewProductMapper());
  gh.factory<_i9.ProductMapper>(() => _i9.ProductMapper());
  gh.factory<_i10.SafeApi>(() => _i10.SafeApi(gh<_i7.NetworkInfo>()));
  gh.factory<_i11.SelectedProductMapper>(() => _i11.SelectedProductMapper());
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => dIModule.prefs,
    preResolve: true,
  );
  gh.factory<_i13.SliderMapper>(() => _i13.SliderMapper());
  gh.factory<_i14.UserLoginDataDM>(() => dIModule.getUserLoginDataDM());
  gh.factory<_i15.UserLoginDataMapper>(() => _i15.UserLoginDataMapper());
  gh.factory<_i16.AppPreferences>(
      () => _i16.AppPreferences(gh<_i12.SharedPreferences>()));
  await gh.factoryAsync<_i17.Dio>(
    () => dioModule.getDio(gh<_i16.AppPreferences>()),
    preResolve: true,
  );
  gh.factory<_i18.HomeMapper>(() => _i18.HomeMapper(
        gh<_i9.ProductMapper>(),
        gh<_i13.SliderMapper>(),
        gh<_i8.NewProductMapper>(),
        gh<_i11.SelectedProductMapper>(),
        gh<_i4.CategoryMapper>(),
      ));
  gh.factory<_i19.HomeServiceClient>(
      () => dIModule.getHomeServiceClient(gh<_i17.Dio>()));
  gh.lazySingleton<_i20.AppCubit>(
      () => _i20.AppCubit(gh<_i16.AppPreferences>()));
  gh.factory<_i21.AuthServiceClient>(
      () => dIModule.getServiceClient(gh<_i17.Dio>()));
  gh.factory<_i22.HomeRemoteDataSource>(
      () => _i22.RemoteDataSourceImpl(gh<_i19.HomeServiceClient>()));
  gh.factory<_i23.HomeRepository>(() => _i24.HomeRepositoryImpl(
        gh<_i10.SafeApi>(),
        gh<_i22.HomeRemoteDataSource>(),
        gh<_i18.HomeMapper>(),
        gh<_i6.MoreProductMapper>(),
      ));
  gh.factory<_i25.HomeUseCase>(
      () => _i25.HomeUseCase(gh<_i23.HomeRepository>()));
  gh.factory<_i26.MoreProductsUseCase>(
      () => _i26.MoreProductsUseCase(gh<_i23.HomeRepository>()));
  gh.factory<_i27.AuthRemoteDataSource>(
      () => _i27.RemoteDataSourceImpl(gh<_i21.AuthServiceClient>()));
  gh.factory<_i28.AuthRepository>(() => _i29.AuthRepositoryImpl(
        gh<_i10.SafeApi>(),
        gh<_i16.AppPreferences>(),
        gh<_i27.AuthRemoteDataSource>(),
        gh<_i15.UserLoginDataMapper>(),
      ));
  gh.factory<_i30.HomeCubit>(() => _i30.HomeCubit(
        gh<_i16.AppPreferences>(),
        gh<_i25.HomeUseCase>(),
      ));
  gh.factory<_i31.MoreProductsCubit>(() => _i31.MoreProductsCubit(
        gh<_i16.AppPreferences>(),
        gh<_i26.MoreProductsUseCase>(),
      ));
  gh.factory<_i32.UserLogInUseCase>(
      () => _i32.UserLogInUseCase(gh<_i28.AuthRepository>()));
  gh.factory<_i33.UserLogInCubit>(() => _i33.UserLogInCubit(
        gh<_i32.UserLogInUseCase>(),
        gh<_i16.AppPreferences>(),
      ));
  return getIt;
}

class _$DIModule extends _i34.DIModule {}

class _$DioModule extends _i35.DioModule {}
