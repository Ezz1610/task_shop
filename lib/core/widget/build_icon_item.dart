import 'package:flutter/material.dart';

import '../app_utils/app_colors.dart';

class BuildIconsItem extends StatelessWidget{
  const BuildIconsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildIconsItem();
  }
  Widget iconItem() {
    return Container(
      width: 69,
      height: 70,
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(5)

      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              //icon
              Icons.print,
              color: AppColors.white,

            ),
            const SizedBox(height: 5,),
            Text(
              //name
              "طباعة",
              style: TextStyle(
                  color: AppColors.white
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildIconsItem()=>SizedBox(
    height: 71,
    child:   ListView.separated(
      shrinkWrap: true,
      itemBuilder:(context,index) =>iconItem(),

      scrollDirection: Axis.horizontal,

      itemCount: 5, separatorBuilder: (BuildContext context, int index) =>const SizedBox(width: 20,),

    ),
  );
}


