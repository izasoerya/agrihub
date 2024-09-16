class EntitiesDevice {
  final String uid;
  final String displayName;
  final List<String> plantUID;
  final String userUID;

  EntitiesDevice({
    required this.uid,
    required this.displayName,
    required this.plantUID,
    required this.userUID,
  });

  EntitiesDevice copyWith({
    String? uid,
    String? displayName,
    List<String>? plantUID,
    String? userUID,
  }) {
    return EntitiesDevice(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      plantUID: plantUID ?? this.plantUID,
      userUID: userUID ?? this.userUID,
    );
  }

  factory EntitiesDevice.fromJson(Map<String, dynamic> json) {
    return EntitiesDevice(
      uid: json['deviceUID'],
      displayName: json['displayName'],
      plantUID: List<String>.from(json['plantUID']),
      userUID: json['userUID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceUID': uid,
      'displayName': displayName,
      'plantUID': plantUID,
      'userUID': userUID,
    };
  }
}
