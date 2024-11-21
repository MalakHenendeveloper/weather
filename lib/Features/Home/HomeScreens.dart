import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Features/Home/Cuibt/HomeScreenviewModel.dart';
import 'package:weather/Features/Home/Cuibt/HomeState.dart';
import 'package:weather/Features/Home/widgets/Custtomitem.dart';
import 'package:weather/core/injectable/injectable.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

class Homescreens extends StatelessWidget {
   Homescreens({super.key});
var viewmodel=getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: BlocBuilder<HomeScreenViewModel, HomeState>(
             bloc: viewmodel..GetWeather(),
              builder: (context,state){
                if(state is HomeError){
                  return Text(state.fauilers.ErrorMasege);

                }
             else if(state is HomeSuccesse){
               return CusttomItem(view: state.currentresponse,);
                }
             else if(state is HomeLoading){
               return Container(
                 child: Center(child: CircularProgressIndicator(color: Colors.white,),),
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: [
                             Color(0xff1a2344),
                             Color.fromARGB(225, 125, 32, 142),
                             Colors.purple,
                             Color.fromARGB(225, 151, 44, 170),
                           ])),);
                }

return Container(child: Text('data'),);
              }
          )),
    );
  }
}
