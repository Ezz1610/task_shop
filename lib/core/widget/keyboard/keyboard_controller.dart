import 'package:get/get.dart';
import 'package:flutter/material.dart';

class KeyboardController extends GetxController {
  static TextEditingController keyboardController = TextEditingController();
  bool isLoading = false;

  changeLoadingEvent(bool loading) {
    isLoading = loading;
    print("$isLoading");
    update();
  }


  keyBoardHandler(int index, TextEditingController controller) {
    switch (index) {
      case 0:
        controller.text += "1";
        break;
      case 1:
        controller.text += "2";

        break;
      case 2:
        controller.text += "3";

        break;
      case 3:
        controller.text += "4";

        break;
      case 4:
        controller.text += "5";

        break;
      case 5:
        controller.text += "6";

        break;
      case 6:
        controller.text += "7";

        break;
      case 7:
        controller.text += "8";

        break;
      case 8:
        {
          controller.text += "9";
        }
        break;

      case 9:
        if (controller.text != "") {
          controller.text += ".";
        }

        break;
      case 10:
        {
          if (controller.text.length < 9) {
            controller.text += '0';
          }
        }

        break;
      case 11:
        if (controller.text.isNotEmpty) {
          controller.text =
              controller.text.substring(0, controller.text.length - 1);
          if (controller.text.isEmpty) {
            // HomeController.totalPriceController.text = "";
            // HomeController.quantityController.text = "";
          }
        }

        break;
      default:
        {
          if (controller.text.length < 9) {
            controller.text += (index + 1).toString();
            print("hh ${controller.text}");
          }
        }

        break;
    }
    update();
  }
}
