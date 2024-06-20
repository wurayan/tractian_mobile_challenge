import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/model/location_model.dart';
import 'package:tractian_challenge_treeview/service/api_rest.dart';

part 'locations_states.dart';

class LocationCubit extends Cubit<LocationsState> {
  LocationCubit() : super(LocationsLoading());

  Api api = Api();

  void getLocation(String companyId) async {
    try {
      List<LocationModel> locations = await api.getLocations(companyId);
      locations.isEmpty
          ? emit(LocationsEmpty("Locations List is Empty"))
          : emit(LocationsSuccess(locations));
    } catch (e) {
      emit(LocationsError(e.toString()));
    }
  }
}
