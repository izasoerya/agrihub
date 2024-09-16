import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:agrihub/src/infrastructure/i_device.dart';

class DeviceService {
  Future<List<EntitiesDevice?>> getDevice() async {
    try {
      final response = await InfrastructureDevice().readAllDevice();
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return [null];
    }
  }

  Future<EntitiesDevice?> addDevice(EntitiesDevice device) async {
    try {
      final response = await InfrastructureDevice().readDevice(device.uid);
      if (response != null) {
        List<String> plantUID = response.plantUID;
        plantUID.add(device.plantUID[0]);
        final data = await InfrastructureDevice()
            .updateDevice(device.copyWith(plantUID: plantUID));
        return data;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
    try {
      final response = await InfrastructureDevice().createDevice(device);
      return response;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
