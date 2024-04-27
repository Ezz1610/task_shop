/*
import 'package:flutter/cupertino.dart';

import '../app_utils/app_colors.dart';


class TotalPriceItem extends StatelessWidget{
  final String ?totalPrice;

  const TotalPriceItem({Key? key,required this.totalPrice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return totalPriceItem(totalPrice);
  }
}

Widget totalPriceItem(String ?totalPrice)=>Container(
  margin: const EdgeInsets.all(10),
  padding: const EdgeInsets.all(10),
  height: 50,
  decoration: BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadius.circular(5)
  ),
  child: Row(
    children:  [
      Text(
        "SAR",
        style: TextStyle(
            fontSize: 22,
            color: AppColors.white
        ),
      ),
      const SizedBox(width: 10,),
      Text(
        "$totalPrice!",
        style: TextStyle(
            color: AppColors.white
        ),
      ),
      const Spacer(),
      Text(
        "الاجمالي",
        style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    ],
  ),
);
*/
