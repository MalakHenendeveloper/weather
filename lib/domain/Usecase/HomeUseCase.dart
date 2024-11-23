import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/domain/repositoreis/HomeRepository.dart';

import '../entities/ResponseEntity.dart';
import 'Fauilers.dart';

@injectable
class HomeUsecase {
  HomeRepository homeRepository;
  HomeUsecase({required this.homeRepository});
  Future<Either<Fauilers, ResponseEntity>> invok({String? city}) {
    return homeRepository.getweather(city: city);
  }
}
