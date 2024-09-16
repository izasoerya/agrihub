import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:agrihub/src/infrastructure/i_device.dart';

class DeviceService {
  Future<List<EntitiesDevice?>> getAllDevice(String userUID) async {
    try {
      final response = await InfrastructureDevice().readAllDevice(userUID);
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return [null];
    }
  }

  Future<EntitiesDevice?> getDevice(String uid) async {
    try {
      final response = await InfrastructureDevice().readDevice(uid);
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<EntitiesDevice?> addDevice(EntitiesDevice device) async {
    try {
      final response = await InfrastructureDevice().createDevice(device);
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
