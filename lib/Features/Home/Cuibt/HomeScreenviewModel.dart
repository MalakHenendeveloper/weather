import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/Features/Home/Cuibt/HomeState.dart';
import 'package:weather/domain/Usecase/HomeUseCase.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeState> {
  HomeScreenViewModel({required this.homeUsecase}):super(HomeInatial());
//  List<CurrentEntity>current=[];
  HomeUsecase homeUsecase;
  GetWeather()async{
    emit(HomeLoading());
    var either=await homeUsecase.invok();
    either.fold((error)=>emit(HomeError(fauilers: error)),
            (response){

      emit(HomeSuccesse(currentresponse: response));});
  }
}