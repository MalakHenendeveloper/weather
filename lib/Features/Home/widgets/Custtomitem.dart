import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Features/Home/widgets/CusttomText.dart';
import 'package:weather/core/Routes_manger/Routes.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

class CusttomItem extends StatelessWidget {
  CusttomItem({super.key, required this.view});
  ResponseEntity view;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
          child: CusttomText(
            text: view.location!.name ?? '',
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Column(
            children: [
              Image.network(
                "http:${view.current!.condition!.icon ?? ''}",
                fit: BoxFit.cover,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              CusttomText(
                text: view.current!.tempC!.toString() + '°C',
              ),
              CusttomText(
                text: "${view.current!.condition!.text}",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CusttomText(
                    text:
                        "Max: ${view.forecast!.forecastday![0].day!.maxtempC}",
                  ),
                  CusttomText(
                    text:
                        "Min: ${view.forecast!.forecastday![0].day!.mintempC}",
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Item(
                    icon: Icons.wb_sunny,
                    size: 20.sp,
                    sizeIcon: 50,
                    color: Colors.white,
                    text: "Sunrise",
                    textdegree:
                        " ${view.forecast!.forecastday![0].astro!.sunrise}",
                    fontWeight: FontWeight.w700,
                  ),
                  Item(
                    icon: Icons.wb_cloudy,
                    size: 20.sp,
                    sizeIcon: 40,
                    color: Colors.white,
                    text: "Monrise",
                    textdegree:
                        " ${view.forecast!.forecastday![0].astro!.moonrise}",
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Item(
                    icon: Icons.opacity,
                    size: 20.sp,
                    sizeIcon: 50,
                    color: Colors.white,
                    text: "Humidity",
                    textdegree: " ${view.current!.humidity}",
                    fontWeight: FontWeight.w700,
                  ),
                  Item(
                    icon: Icons.wind_power,
                    size: 20.sp,
                    sizeIcon: 50,
                    color: Colors.white,
                    text: "Windy",
                    textdegree: " ${view.current!.windKph}",
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A2344)),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.Forecast);
                    },
                    child: Text(
                      'Next 7 Days Forecast',
                      style: TextStyle(fontSize: 21.sp, color: Colors.white),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Item extends StatelessWidget {
  Item(
      {required this.icon,
      required this.text,
      this.sizeIcon,
      this.size,
      this.color,
      super.key,
      this.fontWeight,
      required this.textdegree});
  IconData icon;
  double? sizeIcon;
  double? size;
  String text;
  String textdegree;
  Color? color;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(colors: [
              Color(0xFF1A2344).withOpacity(0.5),
              Color(0xFF1A2344).withOpacity(0.2),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: sizeIcon,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: size, fontWeight: fontWeight, color: color),
            ),
            Text(
              textdegree,
              style: TextStyle(
                  fontSize: size, fontWeight: fontWeight, color: color),
            )
          ],
        ),
      ),
    ));
  }
}
