import 'package:agrihub/src/domain/entities/e_auth.dart';
import 'package:agrihub/src/infrastructure/i_auth.dart';

class AuthenticationService {
  Future<EntitiesAuth?> signIn(String email, String password) async {
    try {
      final response = await InfrastructureAuth().readAllAccount();
      for (var user in response) {
        if (user!.email == email && user.password == password) {
          return user;
        }
      }
      return null;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool?> signUp(EntitiesAuth user) async {
    try {
      final response = await InfrastructureAuth().createAccount(user);
      if (response != null) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
