import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/data_Source/HomeDataSource.dart';
import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';
import 'package:weather/domain/repositoreis/HomeRepository.dart';
@Injectable(as:HomeRepository )
class HomeRepositoryImp implements HomeRepository{
 HomeDataSource homeDataSource;
 HomeRepositoryImp({required this.homeDataSource});
  Future<Either<Fauilers, ResponseEntity>> getweather() async{
  var either=await homeDataSource.getweather();
 return either.fold((error)=>Left(error), (success)=>Right(success));
  }
}