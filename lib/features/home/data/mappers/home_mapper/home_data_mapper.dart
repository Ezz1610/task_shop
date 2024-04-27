
import 'package:task/core/data/mapper/mapper.dart';
import 'package:task/features/home/data/mappers/categories_mapper/category_mapper.dart';
import 'package:task/features/home/data/mappers/new_products_mapper/new_product_mapper.dart';
import 'package:task/features/home/data/mappers/products_mapper/product_mapper.dart';
import 'package:task/features/home/data/mappers/selected_products_mapper/selected_product_mapper.dart';
import 'package:task/features/home/data/mappers/sliders_mapper/slider_mapper.dart';
import 'package:task/features/home/data/responce/home_entity/home_entity.dart';
import 'package:task/features/home/data/responce/products_entity/all_products_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/all_slider_entity.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';

import 'package:injectable/injectable.dart';


@injectable
class HomeMapper extends EntityMapper<HomeEntity, HomeDM> {
  final ProductMapper _productMapper;
  final SliderMapper _sliderMapper;
  final NewProductMapper _newProductMapper;
  final SelectedProductMapper _selectedProductMapper;
  final CategoryMapper _categoryMapper;
  HomeMapper(
      this._productMapper,
      this._sliderMapper,
      this._newProductMapper,
      this._selectedProductMapper,
      this._categoryMapper
      );
  @override
  HomeDM mapFromEntity(HomeEntity? entity) {
    return HomeDM(
        products:_productMapper.mapFromEntityList(entity?.products??[]),
        sliders:_sliderMapper.mapFromEntityList(entity?.sliders??[]),
        newProducts:_newProductMapper.mapFromEntityList(entity?.newProducts??[]),
        selectedProducts:_selectedProductMapper.mapFromEntityList(entity?.selectedProducts??[]),
        categories:_categoryMapper.mapFromEntityList(entity?.categories??[])
    );
  }

  @override
  List<HomeDM> mapFromEntityList(List<HomeEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  HomeEntity? mapToEntity(HomeDM domainModel) {
    throw UnimplementedError();
  }
}
