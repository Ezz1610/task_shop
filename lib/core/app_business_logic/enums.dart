// ignore_for_file: constant_identifier_names

import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';



String translator({required arabicWord, required englishWord}) {

  return getIt<AppPreferences>().appLanguage == 'ar' ? arabicWord : englishWord;
}



enum PrintingStatus { NOTPRINT, FIRSTPRINT, DUPLICATPRINT, ERROR }

PrintingStatus setPrintingState(int currentState) {
  switch (currentState) {
    case 0:
      return PrintingStatus.NOTPRINT;
    case 1:
      return PrintingStatus.FIRSTPRINT;
    case 2:
      return PrintingStatus.DUPLICATPRINT;
    case 3:
      return PrintingStatus.ERROR;
    default:
      return PrintingStatus.NOTPRINT;
  }
}

String setPlatform(String number) {
  switch (number) {

    case "1":
      return 'Android';
    case "2":
      return 'IOS';
    default:
      return '';
  }
}

Color setPrintingStateColor(int currentState) {
  switch (currentState) {
    case 0:
      return Colors.white;
    case 1:
      return Colors.white;
    case 2:
      return Colors.white;
    case 3:
      return Colors.red;
    default:
      return Colors.white;
  }
}

int getPrintingStateValues(PrintingStatus status) {
  switch (status) {
    case PrintingStatus.NOTPRINT:
      return 0;
    case PrintingStatus.FIRSTPRINT:
      return 1;
    case PrintingStatus.DUPLICATPRINT:
      return 2;
    case PrintingStatus.ERROR:
      return 3;
    default:
      return 0;
  }
}

int setPrintingStateValues(int status) {
  switch (status) {
    case 0:
      return 1;
    case 1:
      return 2;
    case 3:
      return 3;
    case 4:
      return 2;
    case 5:
      return 5;
      case 6:
      return 5;
    default:
      return 2;
  }
}

enum OrderStatus { ACTIVE, CANCELED, PAIED }

OrderStatus getOrderStatusValue(String status) {
  switch (status) {
    case "1":
      return OrderStatus.ACTIVE;
    case "2":
      return OrderStatus.PAIED;
    case "3":
      return OrderStatus.CANCELED;
    default:
      return OrderStatus.ACTIVE;
  }
}

int getOrderStatus(OrderStatus status) {
  switch (status) {
    case OrderStatus.ACTIVE:
      return 1;
    case OrderStatus.PAIED:
      return 2;
    case OrderStatus.CANCELED:
      return 3;
    default:
      return 1;
  }
}

enum OrderType { TAKEAWAY, ONSTORE, DELiVERY, NOTSELECTED }

String getOrderTypeAr(OrderType orderType) {
  switch (orderType) {
    case OrderType.DELiVERY:
      return "توصيل";
    case OrderType.ONSTORE:
      return "محلي";
    case OrderType.TAKEAWAY:
      return "سفري";
    default:
      return "نوع الطلب";
  }
}

OrderType getOrderTypeConverted(String orderType) {
  switch (orderType) {
    case "DELiVERY":
      return OrderType.DELiVERY;
    case "ONSTORE":
      return OrderType.ONSTORE;
    case "TAKEAWAY":
      return OrderType.TAKEAWAY;
    default:
      return OrderType.NOTSELECTED;
  }
}

int getOrderTypeStatus(String type) {
  if (type == OrderType.TAKEAWAY.name) {
    return 1;
  } else if (type == OrderType.ONSTORE.name) {
    return 2;
  } else if (type == OrderType.DELiVERY.name) {
    return 3;
  } else {
    return 2;
  }
}

OrderType getOrderType(int type) {
  switch (type) {
    case 1:
      return OrderType.TAKEAWAY;
    case 2:
      return OrderType.ONSTORE;
    case 3:
      return OrderType.DELiVERY;
    default:
      return OrderType.NOTSELECTED;
  }
}

enum AccoutType { TAXSINCLUDED, TAXSNOTINCLUDED }

AccoutType getAccountType(String type) {
  switch (type) {
    case "2":
      return AccoutType.TAXSINCLUDED;
    case "1":
      return AccoutType.TAXSNOTINCLUDED;
    default:
      return AccoutType.TAXSNOTINCLUDED;
  }
}

int getAccountStatus(String type) {
  if (type == AccoutType.TAXSINCLUDED.name) {
    return 2;
  } else if (type == AccoutType.TAXSNOTINCLUDED.name) {
    return 1;
  } else {
    return 1;
  }
}

enum CartProductStatus { PREPARING, PRINTED, CANCELED, ADDED }

CartProductStatus getCartProductStatus(int status) {
  switch (status) {
    case 1:
      return CartProductStatus.PREPARING;
    case 2:
      return CartProductStatus.CANCELED;
    case 3:
      return CartProductStatus.ADDED;
    default:
      return CartProductStatus.PREPARING;
  }
}



getOrderStatusTitle(int stats) {
  switch (stats) {
    case 1:
      return "نشط";
    case 2:
      return "مسدد";
    case 3:
      return "ملغي";
    case 4:
      return "ارجاع";
    default:
      return "نشط";
  }
}

// getCancelTitle(int stats) {
//   switch (stats) {
//     case 1:
//       //الغاء
//       return App.tr.close;
//     case 2:
//       //ارجاع
//       return  App.tr.restoration;
//     case 3:
//       return App.tr.close;
//     default:
//       return App.tr.close;
//   }
// }

getCancelId(int stats) {
  switch (stats) {
    case 1:
      return "5";
    case 2:
      return "6";
    default:
      return "5";
  }
}
