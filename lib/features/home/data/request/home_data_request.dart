import 'dart:io';

import 'package:json_annotation/json_annotation.dart';


class HomeDataRequest{
  final String authKey;
  final String userId;




  HomeDataRequest(
     this.authKey,
     this.userId,

  );

}