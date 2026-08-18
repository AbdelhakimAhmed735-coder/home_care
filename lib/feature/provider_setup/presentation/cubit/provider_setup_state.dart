class ProviderSetupState {
  final String name;
  final String phone;
  final String service;
  final double? latitude;
  final double? longitude;
  final String address;

  const ProviderSetupState({
    this.name = '',
    this.phone = '',
    this.service = '',
    this.latitude,
    this.longitude,
    this.address = '',
  });
}
