import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/location_service.dart';
import 'provider_setup_state.dart';

class ProviderSetupCubit extends Cubit<ProviderSetupState> {
  ProviderSetupCubit() : super(const ProviderSetupState());

  final LocationService _locationService = LocationService();

  void updateName(String name) {
    emit(
      ProviderSetupState(
        name: name,
        phone: state.phone,
        service: state.service,
        latitude: state.latitude,
        longitude: state.longitude,
        address: state.address,
      ),
    );
  }

  void updatePhone(String phone) {
    emit(
      ProviderSetupState(
        name: state.name,
        phone: phone,
        service: state.service,
        latitude: state.latitude,
        longitude: state.longitude,
        address: state.address,
      ),
    );
  }

  void updateService(String service) {
    emit(
      ProviderSetupState(
        name: state.name,
        phone: state.phone,
        service: service,
        latitude: state.latitude,
        longitude: state.longitude,
        address: state.address,
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    final position = await _locationService.getCurrentLocation();

    final address = await _locationService.getAddressFromCoordinates(
      position.latitude,
      position.longitude,
    );

    emit(
      ProviderSetupState(
        name: state.name,
        phone: state.phone,
        service: state.service,
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );
  }

  void updateLocation({
    required double latitude,
    required double longitude,
    required String address,
  }) {
    emit(
      ProviderSetupState(
        name: state.name,
        phone: state.phone,
        service: state.service,
        latitude: latitude,
        longitude: longitude,
        address: address,
      ),
    );
  }
}
