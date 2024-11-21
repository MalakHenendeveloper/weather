import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/data_Source/Forecast/ForcastDatasource.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
import 'package:weather/domain/repositoreis/ForecastRepository.dart';
@Injectable(as: ForecastRepository)
class ForecastRepositoryimp implements ForecastRepository{
  ForecastDataSource dataSource;
  ForecastRepositoryimp({
    required this.dataSource
});
  Future<Either<Fauilers, ResponseEntity>> getForecast(String city) async{
  var either=await dataSource.getForecast(city);
 return either.fold((error)=>Left(error), (success)=>Right(success));
  }
}