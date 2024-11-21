import 'package:dartz/dartz.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';


abstract class HomeRepository{
  Future<Either<Fauilers, ResponseEntity>>getweather();
}