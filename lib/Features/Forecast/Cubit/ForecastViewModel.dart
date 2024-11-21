import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/Features/Forecast/Cubit/ForecastState.dart';
import 'package:weather/domain/Usecase/ForecastUsecase.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
@injectable
class ForecastViewModel extends Cubit<ForecastState>{
  ForecastViewModel({required this.forecastUsecas}):super(ForecastInatial());
  ForecastUsecas forecastUsecas;
  List<ForecastEntityday> forecastday=[];
  getforecast(String city)async{
    emit(ForecastLoading());

 var either=  await forecastUsecas.invok(city);
 either.fold((error)=>emit(ForecastError(fauilers: error)),
     (response){
   forecastday=response.forecast!.forecastday??[];
   emit(ForecastSuccess(responseEntity: response));
     }
 );
  }

}