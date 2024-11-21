import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/Routes_manger/Routes.dart';
import 'package:weather/core/Routes_manger/Routes_manger.dart';

import 'core/injectable/injectable.dart';
import 'core/resouece/Bloc.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) => MaterialApp(
        home: child,
        initialRoute: AppRoutes.Home,
        onGenerateRoute: RoutesManger.getRoute,
      ),
    );
  }
}
