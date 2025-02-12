import 'package:dartz/dartz.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

abstract class ForecastRepository{
  Future<Either<Fauilers, ResponseEntity>>getForecast(String city);
}