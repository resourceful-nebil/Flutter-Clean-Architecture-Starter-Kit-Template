import 'package:happytech_clean_architecture/core/databases/api/end_points.dart';
import 'package:happytech_clean_architecture/features/user/domain/entities/sub_enities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json[ApiKey.lat],
      lng: json[ApiKey.lng],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.lat: lat,
      ApiKey.lng: lng,
    };
  }
}
