import 'package:flutter/material.dart';
import 'package:weather/Features/Forecast/ForecastScreen.dart';
import 'package:weather/Features/Home/HomeScreens.dart';
import 'package:weather/core/Routes_manger/Routes.dart';

class RoutesManger {
  static Route<dynamic> getRoute(RouteSettings settinge) {
    switch (settinge.name) {
      case AppRoutes.Home:
        return MaterialPageRoute(builder: (context) => Homescreens());
      case AppRoutes.Forecast:
        return MaterialPageRoute(builder: (context) => ForecastScreen());
      default:
        return undefindPage();
    }
  }

  static Route<dynamic> undefindPage() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("Not route found"),
              ),
              body: Center(
                child: Text('Not Route Found'),
              ),
            ));
  }
}
