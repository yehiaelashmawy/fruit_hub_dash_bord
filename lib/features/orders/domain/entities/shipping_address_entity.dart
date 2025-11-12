class ShippingAddressEntity {
  String? name;
  String? phone;
  String? addressDetails;
  String? city;
  String? email;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.addressDetails,
    this.floor,
    this.city,
    this.email,
  });

  @override
  String toString() {
    return '$addressDetails $floor $city';
  }
}