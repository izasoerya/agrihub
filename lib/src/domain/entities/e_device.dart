import 'package:agrihub/src/domain/entities/e_plant.dart';

class EntitiesDevice {
  final String deviceUID;
  final String plantUID;
  final String userUID;
  final EntitiesPlant plant;

  EntitiesDevice({
    required this.deviceUID,
    required this.plantUID,
    required this.userUID,
    required this.plant,
  });

  EntitiesDevice copyWith({
    String? deviceUID,
    String? plantUID,
    String? userUID,
    EntitiesPlant? plant,
  }) {
    return EntitiesDevice(
      deviceUID: deviceUID ?? this.deviceUID,
      plantUID: plantUID ?? this.plantUID,
      userUID: userUID ?? this.userUID,
      plant: plant ?? this.plant,
    );
  }

  factory EntitiesDevice.fromJson(Map<String, dynamic> json) {
    return EntitiesDevice(
      deviceUID: json['deviceUID'],
      plantUID: json['plantUID'],
      userUID: json['userUID'],
      plant: EntitiesPlant.fromJson(json['plant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceUID': deviceUID,
      'plantUID': plantUID,
      'userUID': userUID,
      'plant': plant.toJson(),
    };
  }
}
