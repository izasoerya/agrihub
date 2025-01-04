enum PlantStrain {
  sawi,
  bayam,
  jagung,
}

extension PlantStrainExtension on PlantStrain {
  static PlantStrain parseToEnum(String value) {
    switch (value) {
      case 'sawi':
        return PlantStrain.sawi;
      case 'bayam':
        return PlantStrain.bayam;
      case 'jagung':
        return PlantStrain.jagung;
      default:
        return PlantStrain.sawi;
    }
  }

  String parseToString() {
    switch (this) {
      case PlantStrain.sawi:
        return 'sawi';
      case PlantStrain.bayam:
        return 'bayam';
      case PlantStrain.jagung:
        return 'jagung';
    }
  }
}
