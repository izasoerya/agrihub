enum PlantStrain {
  sawi,
  bayam,
  jagung,
}

extension PlantStrainExtension on PlantStrain {
  static PlantStrain parseToEnum(String value) {
    switch (value) {
      case 'Sawi':
        return PlantStrain.sawi;
      case 'Bayam':
        return PlantStrain.bayam;
      case 'Jagung':
        return PlantStrain.jagung;
      default:
        return PlantStrain.sawi;
    }
  }

  String parseToString() {
    switch (this) {
      case PlantStrain.sawi:
        return 'Sawi';
      case PlantStrain.bayam:
        return 'Bayam';
      case PlantStrain.jagung:
        return 'Jagung';
    }
  }
}
