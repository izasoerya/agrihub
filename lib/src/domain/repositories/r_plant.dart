import 'package:agrihub/src/domain/entities/e_plant.dart';

abstract class RepositoryPlant {
  Future<EntitiesPlant?> createPlant(EntitiesPlant plant);
  Future<EntitiesPlant?> readPlant(String code);
  Future<List<EntitiesPlant?>> readAllPlant();
  Future<EntitiesPlant?> updatePlant(EntitiesPlant plant);
  Future<bool?> deletePlant(String code);
}
