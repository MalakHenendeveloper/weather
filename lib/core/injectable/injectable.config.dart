// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_Source/HomeDataSource.dart' as _i21;
import '../../data/data_Source/HomedataSourceImp.dart' as _i899;
import '../../data/repositoreis/HomeRepositoryImp.dart' as _i410;
import '../../domain/repositoreis/HomeRepository.dart' as _i721;
import '../../domain/Usecase/HomeUseCase.dart' as _i492;
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
    gh.factory<_i21.HomeDataSource>(
        () => _i899.HomeDataSourceImp(api: gh<_i868.ApiManger>()));
    gh.factory<_i721.HomeRepository>(() =>
        _i410.HomeRepositoryImp(homeDataSource: gh<_i21.HomeDataSource>()));
    gh.factory<_i492.HomeUsecase>(
        () => _i492.HomeUsecase(homeRepository: gh<_i721.HomeRepository>()));
    gh.factory<_i985.HomeScreenViewModel>(
        () => _i985.HomeScreenViewModel(homeUsecase: gh<_i492.HomeUsecase>()));
    return this;
  }
}
