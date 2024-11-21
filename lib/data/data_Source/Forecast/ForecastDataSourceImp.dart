import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/api/Api_manger.dart';
import 'package:weather/data/data_Source/Forecast/ForcastDatasource.dart';
import 'package:weather/data/models/ResponseDto.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
@Injectable(as:ForecastDataSource )
class  ForecastDataSourceimp implements ForecastDataSource{
 ApiManger apiManger;
 ForecastDataSourceimp({
   required this.apiManger
});
  Future<Either<Fauilers, ResponseEntity>> getForecast(String city) async{
    try{
      var response= await apiManger.getDataForecast(city);
      var responseForecast= ResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&& response.statusCode!<=299){
        return Right(responseForecast);
      }

      else {
        return Left(ServerError(ErrorMasege: response.statusMessage!));
      }
    }

        catch(e){
          return Left(NetworkError(ErrorMasege:e.toString()));
        }
  }
}