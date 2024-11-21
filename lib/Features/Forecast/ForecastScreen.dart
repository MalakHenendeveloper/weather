import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/Widgets/CusttomText.dart';

class ForecastScreen extends StatelessWidget {
   ForecastScreen({super.key, required this.city});
String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //  width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff1a2344),
              Color.fromARGB(225, 125, 32, 142),
              Colors.purple,
              Color.fromARGB(225, 151, 44, 170),
            ])),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h, left: 20.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        weight: 100.w,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w, vertical: 20.h),
                    child: CusttomText(
                      text: '7 Day Forecast',
                      fontWeight: FontWeight.w700,
                      fontsize: 35.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 800.h,
              child: BlocBuilder(
                builder: (context,state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 120.h,
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                              leading: Icon(
                                Icons.sunny,
                                color: Colors.white,
                                size: 65,
                              ),
                              title: Text(
                                "datadata",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25.sp),
                              ),
                              subtitle: Text(
                                "datadata",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20.sp),
                              )));
                    },
                    itemCount: 10,
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}