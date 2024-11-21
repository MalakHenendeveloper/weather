import 'package:weather/domain/Usecase/Fauilers.dart';
import 'package:weather/domain/entities/ResponseEntity.dart';

abstract class HomeState{}
class HomeInatial extends HomeState{}
class HomeLoading extends HomeState{}
class HomeLoadingUpdate extends HomeState{}
class HomeError extends HomeState{
  Fauilers fauilers;
  HomeError({required this.fauilers});
}
class HomeSuccesse extends HomeState{
  ResponseEntity currentresponse;
  HomeSuccesse ({required this.currentresponse});
}
class HomeSuccesseUpdata extends HomeState{
  ResponseEntity currentresponse;
  HomeSuccesseUpdata ({required this.currentresponse});
}