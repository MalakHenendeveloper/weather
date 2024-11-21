// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_Source/Forecast/ForcastDatasource.dart' as _i735;
import '../../data/data_Source/Forecast/ForecastDataSourceImp.dart' as _i513;
import '../../data/data_Source/Home/HomeDataSource.dart' as _i611;
import '../../data/data_Source/Home/HomedataSourceImp.dart' as _i206;
import '../../data/repositoreis/ForecastRepositoryimp.dart' as _i372;
import '../../data/repositoreis/HomeRepositoryImp.dart' as _i410;
import '../../domain/repositoreis/ForecastRepository.dart' as _i669;
import '../../domain/repositoreis/HomeRepository.dart' as _i721;
import '../../domain/Usecase/ForecastUsecase.dart' as _i520;
import '../../domain/Usecase/HomeUseCase.dart' as _i492;
import '../../Features/Forecast/Cubit/ForecastViewModel.dart' as _i290;
import '../../Features/Home/Cuibt/HomeScreenviewModel.dart' as _i985;
import '../api/Api_manger.dart' as _i868;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i868.ApiManger>(() => _i868.ApiManger());
    gh.factory<_i611.HomeDataSource>(
        () => _i206.HomeDataSourceImp(api: gh<_i868.ApiManger>()));
    gh.factory<_i735.ForecastDataSource>(
        () => _i513.ForecastDataSourceimp(apiManger: gh<_i868.ApiManger>()));
    gh.factory<_i669.ForecastRepository>(() => _i372.ForecastRepositoryimp(
        dataSource: gh<_i735.ForecastDataSource>()));
    gh.factory<_i520.ForecastUsecas>(
        () => _i520.ForecastUsecas(forecast: gh<_i669.ForecastRepository>()));
    gh.factory<_i721.HomeRepository>(() =>
        _i410.HomeRepositoryImp(homeDataSource: gh<_i611.HomeDataSource>()));
    gh.factory<_i492.HomeUsecase>(
        () => _i492.HomeUsecase(homeRepository: gh<_i721.HomeRepository>()));
    gh.factory<_i985.HomeScreenViewModel>(
        () => _i985.HomeScreenViewModel(homeUsecase: gh<_i492.HomeUsecase>()));
    gh.factory<_i290.ForecastViewModel>(() =>
        _i290.ForecastViewModel(forecastUsecas: gh<_i520.ForecastUsecas>()));
    return this;
  }
}
