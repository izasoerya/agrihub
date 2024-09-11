import 'package:agrihub/src/domain/entities/e_auth.dart';

abstract class RespositoryAuth {
  Future<EntitiesAuth?> createAccount(EntitiesAuth user);
  Future<EntitiesAuth?> readAccount(EntitiesAuth user);
  Future<List<EntitiesAuth?>> readAllAccount();
  Future<EntitiesAuth?> updateAccount(EntitiesAuth user);
  Future<bool?> deleteAccount(EntitiesAuth user);
}
