import 'package:agrihub/src/domain/entities/e_plant.dart';
import 'package:agrihub/src/infrastructure/i_plant.dart';

class PlantService {
  Future<List<EntitiesPlant?>> getPlants() async {
    try {
      final response = await InfrastructurePlant().readAllPlant();
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return [null];
    }
  }

  Future<EntitiesPlant?> getPlant(String uid) async {
    try {
      final response = await InfrastructurePlant().readPlant(uid);
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
