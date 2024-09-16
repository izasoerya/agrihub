import 'package:agrihub/src/domain/entities/e_plant.dart';

class EntitiesDevice {
  final String uid;
  final List<String> plantUID;
  final String userUID;

  EntitiesDevice({
    required this.uid,
    required this.plantUID,
    required this.userUID,
  });

  EntitiesDevice copyWith({
    String? uid,
    List<String>? plantUID,
    String? userUID,
    EntitiesPlant? plant,
  }) {
    return EntitiesDevice(
      uid: uid ?? this.uid,
      plantUID: plantUID ?? this.plantUID,
      userUID: userUID ?? this.userUID,
    );
  }

  factory EntitiesDevice.fromJson(Map<String, dynamic> json) {
    return EntitiesDevice(
      uid: json['deviceUID'],
      plantUID: List<String>.from(json['plantUID']),
      userUID: json['userUID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceUID': uid,
      'plantUID': plantUID,
      'userUID': userUID,
    };
  }
}
