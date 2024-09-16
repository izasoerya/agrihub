import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:agrihub/src/domain/repositories/r_device.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfrastructureDevice implements RepositoryDevice {
  final db = FirebaseFirestore.instance;
  @override
  Future<EntitiesDevice?> createDevice(EntitiesDevice device) async {
    DocumentSnapshot doc = await db
        .collection('device')
        .doc(device.uid)
        .set(device.toJson())
        .then((value) => db.collection('device').doc(device.uid).get());
    if (doc.exists) {
      return EntitiesDevice.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<List<EntitiesDevice?>> readAllDevice() async {
    // TODO: implement readAllDevice

    throw UnimplementedError();
  }

  @override
  Future<EntitiesDevice?> readDevice(String code) async {
    DocumentSnapshot doc = await db.collection('device').doc(code).get();
    if (doc.exists) {
      return EntitiesDevice.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<EntitiesDevice?> updateDevice(EntitiesDevice device) async {
    DocumentSnapshot doc = await db
        .collection('device')
        .doc(device.uid)
        .update(device.toJson())
        .then((value) => db.collection('device').doc(device.uid).get());
    if (doc.exists) {
      return EntitiesDevice.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<bool?> deleteDevice(String code) {
    // TODO: implement deleteDevice
    throw UnimplementedError();
  }
}
