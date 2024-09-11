import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:agrihub/src/domain/entities/e_auth.dart';
import 'package:agrihub/src/domain/repositories/r_auth.dart';

class InfrastructureAuth implements RespositoryAuth {
  final db = FirebaseFirestore.instance;
  @override
  Future<EntitiesAuth?> createAccount(EntitiesAuth user) async {
    DocumentSnapshot doc = await db
        .collection('user')
        .doc(user.uid)
        .set(user.toJson())
        .then((value) => db.collection('user').doc(user.uid).get());
    if (doc.exists) {
      return EntitiesAuth.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<EntitiesAuth?> readAccount(EntitiesAuth user) async {
    DocumentSnapshot doc = await db.collection('user').doc('user').get();
    if (doc.exists) {
      return EntitiesAuth.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  @override
  Future<List<EntitiesAuth?>> readAllAccount() async {
    QuerySnapshot querySnapshot = await db.collection('user').get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) =>
              EntitiesAuth.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } else {
      print('No documents found');
      return [];
    }
  }

  @override
  Future<EntitiesAuth?> updateAccount(EntitiesAuth user) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAccount(EntitiesAuth user) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }
}
