import 'package:agrihub/src/domain/entities/e_plant.dart';
import 'package:agrihub/src/domain/repositories/r_plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfrastructurePlant implements RepositoryPlant {
  final db = FirebaseFirestore.instance;
  @override
  Future<EntitiesPlant?> createPlant(EntitiesPlant plant) async {
    DocumentSnapshot doc = await db
        .collection('plant')
        .doc(plant.uid)
        .set(plant.toJson())
        .then((value) => db.collection('plant').doc(plant.uid).get());
    if (doc.exists) {
      return EntitiesPlant.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<List<EntitiesPlant?>> readAllPlant() {
    // TODO: implement readAllPlant
    throw UnimplementedError();
  }

  @override
  Future<EntitiesPlant?> readPlant(String code) async {
    DocumentSnapshot doc =
        await db.collection('plant').doc('x1P9TgWjKOpH4Snylbtw').get();
    if (doc.exists) {
      print('Document data: ${doc.data()}');
      return EntitiesPlant.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<EntitiesPlant?> updatePlant(EntitiesPlant plant) {
    // TODO: implement updatePlant
    throw UnimplementedError();
  }

  @override
  Future<bool?> deletePlant(String code) {
    // TODO: implement deletePlant
    throw UnimplementedError();
  }
}
