class CoordinatesModel {
  double lat;
  double lng;

  CoordinatesModel({required this.lat, required this.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
        lat: json['lat'],
        lng: json['lng']
    );
  }
}
