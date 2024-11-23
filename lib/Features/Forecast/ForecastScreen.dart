import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Features/Forecast/Cubit/ForecastState.dart';
import 'package:weather/Features/Forecast/Cubit/ForecastViewModel.dart';
import 'package:weather/core/Widgets/CusttomText.dart';
import 'package:weather/core/api/Service.dart';
import 'package:weather/core/injectable/injectable.dart';

class ForecastScreen extends StatelessWidget {
  ForecastScreen({
    super.key,
  });

  @override
  var viewmodel = getIt<ForecastViewModel>();
  var location = LocationService();
  Widget build(BuildContext context) {
    location.getCurrentLocation().then(
      (value) {
        if (value != null) {
          print("Latitude: ${value.latitude}, Longitude: ${value.longitude}");
          viewmodel.getforecast("${value.latitude}+${value.longitude}");
        }
      },
    );
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
              child: BlocBuilder<ForecastViewModel, ForecastState>(
                  bloc: viewmodel,
                  builder: (context, state) {
                    if (state is ForecastSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 125.h,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                  leading: Image.network(
                                      "http:${viewmodel.forecastday[index].day!.condition!.icon}"),
                                  title: Text(
                                    "${viewmodel.forecastday[index].day!.avgtempC}"
                                    " ${viewmodel.forecastday[index].date}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25.sp),
                                  ),
                                  subtitle: Text(
                                    "Max: ${viewmodel.forecastday[index].day!.maxtempC}  "
                                    "Min:${viewmodel.forecastday[index].day!.mintempC}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  )));
                        },
                        itemCount: viewmodel.forecastday.length,
                      );
                    } else if (state is ForecastError) {
                      return Text(state.fauilers.ErrorMasege);
                    } else if (state is ForecastLoading) {
                      return Center(
                        child: Text(
                          " Loading..... ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    }
                    return Center(
                      child: Text(
                        " Loading..... ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
