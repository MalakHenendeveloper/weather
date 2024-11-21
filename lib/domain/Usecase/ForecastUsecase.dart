import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
import 'package:weather/domain/repositoreis/ForecastRepository.dart';

import 'Fauilers.dart';
@injectable
class ForecastUsecas{
  ForecastRepository forecast;
  ForecastUsecas({required this.forecast});
  Future<Either<Fauilers, ResponseEntity>>  invok(String city){
  return  forecast.getForecast(city);
  }

}