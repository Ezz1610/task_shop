import 'dart:io';

import 'package:json_annotation/json_annotation.dart';


class MoreProductsDataRequest{
  final String authKey;
  final String userId;
  final String searchWith;
  final String homeTypes;
  final String itemCount;
  final String limit;


  MoreProductsDataRequest(
     this.authKey,
     this.userId,
      this.searchWith,
      this.homeTypes,
      this.itemCount,
      this.limit,


      );

}