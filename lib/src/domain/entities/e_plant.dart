class EntitiesPlant {
  final String plantUID;
  final double humidity;
  final DateTime checkedAt;

  EntitiesPlant({
    required this.plantUID,
    required this.humidity,
    required this.checkedAt,
  });

  EntitiesPlant copyWith({
    String? plantUID,
    double? humidity,
    DateTime? checkedAt,
  }) {
    return EntitiesPlant(
      plantUID: plantUID ?? this.plantUID,
      humidity: humidity ?? this.humidity,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }

  factory EntitiesPlant.fromJson(Map<String, dynamic> json) {
    return EntitiesPlant(
      plantUID: json['plantUID'],
      humidity: json['humidity'],
      checkedAt: DateTime.parse(json['checkedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plantUID': plantUID,
      'humidity': humidity,
      'checkedAt': checkedAt.toIso8601String(),
    };
  }
}
