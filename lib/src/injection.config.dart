// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/manager/imageManager.dart' as _i3;
import '../core/services/package_service.dart' as _i4;
import '../core/services/rack_location_service.dart' as _i5;
import 'home/homeViewController.dart' as _i9;
import 'package/add_package_view_controller.dart' as _i8;
import 'rack_locations/rack_locations_view_controller.dart' as _i6;
import 'search/search_view_controller.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ImageManager>(_i3.ImageManager());
  gh.factory<_i4.PackageService>(() => _i4.PackageService());
  gh.factory<_i5.RackLocationService>(() => _i5.RackLocationService());
  gh.factory<_i6.RackLocationsViewController>(
      () => _i6.RackLocationsViewController(get<_i5.RackLocationService>()));
  gh.factory<_i7.SearchViewController>(
      () => _i7.SearchViewController(get<_i4.PackageService>()));
  gh.factory<_i8.AddPackageViewController>(() => _i8.AddPackageViewController(
      get<_i4.PackageService>(), get<_i5.RackLocationService>()));
  gh.factory<_i9.HomeViewController>(
      () => _i9.HomeViewController(get<_i3.ImageManager>()));
  return get;
}
