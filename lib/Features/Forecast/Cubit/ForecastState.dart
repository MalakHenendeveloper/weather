import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

abstract class ForecastState{}
class ForecastInatial extends ForecastState{}
class ForecastLoading extends ForecastState{}
class ForecastError extends ForecastState{
  Fauilers fauilers;
  ForecastError({required this.fauilers});
}
class ForecastSuccess extends ForecastState{
  ResponseEntity responseEntity;
  ForecastSuccess({required this.responseEntity});
}

