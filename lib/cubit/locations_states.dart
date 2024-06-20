part of 'locations_cubit.dart';

final class LocationsState {}

final class LocationsLoading extends LocationsState {}

final class LocationsEmpty extends LocationsState {
  final String msg;
  LocationsEmpty(this.msg);
}

final class LocationsError extends LocationsState {
  final String msg;
  LocationsError(this.msg);
}

final class LocationsSuccess extends LocationsState {
  final List<LocationModel> locations;
  LocationsSuccess(this.locations);
}
