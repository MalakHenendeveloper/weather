import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/api/Api_manger.dart';
import 'package:weather/core/api/Endpoints.dart';
import 'package:weather/data/data_Source/Home/HomeDataSource.dart';
import 'package:weather/data/models/ResponseDto.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  ApiManger api;
  HomeDataSourceImp({required this.api});
  Future<Either<Fauilers, ResponseEntity>> getweather({String? city}) async {
    try {
      var response = await api.getData(city: city);
      var responsecurrent = ResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(responsecurrent);
      } else {}
      return Left(ServerError(ErrorMasege: response.statusMessage!));
    } catch (e) {
      return Left(NetworkError(ErrorMasege: e.toString()));
    }
  }
}
