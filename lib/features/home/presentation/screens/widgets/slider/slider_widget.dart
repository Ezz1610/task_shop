import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';

class SliderWidget extends StatelessWidget{
  const SliderWidget({super.key,required this.homeDM});
  final HomeDM homeDM;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items:homeDM.sliders?.map((e) =>
                Image(
                  image: NetworkImage(e.image!),

                  width: double.infinity,
                  fit: BoxFit.cover,
                )).toList(),

            options: CarouselOptions(
              viewportFraction: 1,
              height: 150,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds:3),
              autoPlayAnimationDuration:const Duration(seconds: 1),
              autoPlayCurve: Curves.easeInOutBack,
              scrollDirection: Axis.horizontal,



            ),
          ),
        ],
      ),
    );
  }

}