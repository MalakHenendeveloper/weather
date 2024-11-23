import 'package:dartz/dartz.dart';

import '../../../domain/Usecase/Fauilers.dart';
import '../../../domain/entities/ResponseEntity.dart';

abstract class HomeDataSource {
  Future<Either<Fauilers, ResponseEntity>> getweather({String? city});
}
