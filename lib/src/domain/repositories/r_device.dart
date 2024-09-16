import 'package:agrihub/src/domain/entities/e_device.dart';

abstract class RepositoryDevice {
  Future<EntitiesDevice?> createDevice(EntitiesDevice device);
  Future<EntitiesDevice?> readDevice(String code);
  Future<List<EntitiesDevice?>> readAllDevice();
  Future<EntitiesDevice?> updateDevice(EntitiesDevice device);
  Future<bool?> deleteDevice(String code);
}
