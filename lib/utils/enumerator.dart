enum PlantStrain {
  bayam,
  jagung,
  singkong,
  kubis,
  daunBawang,
}

extension PlantStrainExtension on PlantStrain {
  static PlantStrain parseToEnum(String value) {
    switch (value) {
      case 'Daun Bawang':
        return PlantStrain.daunBawang;
      case 'Bayam':
        return PlantStrain.bayam;
      case 'Jagung':
        return PlantStrain.jagung;
      case 'Singkong':
        return PlantStrain.singkong;
      case 'Kubis':
        return PlantStrain.kubis;
      default:
        return PlantStrain.kubis;
    }
  }

  String parseToString() {
    switch (this) {
      case PlantStrain.daunBawang:
        return 'Daun Bawang';
      case PlantStrain.bayam:
        return 'Bayam';
      case PlantStrain.jagung:
        return 'Jagung';
      case PlantStrain.singkong:
        return 'Singkong';
      case PlantStrain.kubis:
        return 'Kubis';
    }
  }
}

enum UserTypes {
  farmer,
  buyer,
}
