import 'package:cloud_firestore/cloud_firestore.dart';

class EntitiesPlant {
  final String uid;
  final double humidity;
  final DateTime checkedAt;

  EntitiesPlant({
    required this.uid,
    required this.humidity,
    required this.checkedAt,
  });

  EntitiesPlant copyWith({
    String? uid,
    double? humidity,
    DateTime? checkedAt,
  }) {
    return EntitiesPlant(
      uid: uid ?? this.uid,
      humidity: humidity ?? this.humidity,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }

  factory EntitiesPlant.fromJson(Map<String, dynamic> json) {
    return EntitiesPlant(
      uid: json['plantUID'],
      humidity: double.parse(json['humidity'].toString()),
      checkedAt: (json['checkedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plantUID': uid,
      'humidity': humidity,
      'checkedAt': Timestamp.fromDate(checkedAt),
    };
  }
}
