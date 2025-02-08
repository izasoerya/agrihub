import 'package:agrihub_new/app/routes/routes.dart';
import 'package:agrihub_new/domain/entities/e_user.dart';
import 'package:agrihub_new/domain/service/s_user.dart';
import 'package:agrihub_new/utils/default_user.dart';
import 'package:agrihub_new/utils/enumerator.dart';

class AuthController {
  const AuthController();

  Future<bool> signIn(String email, String password) async {
    final res = await ServiceUser().signIn(email, password);
    if (res != null) {
      defaultUser = LoggedUser(
        user: res,
        type: UserTypes.farmer,
      );
      router.go('/dashboard');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signInAsBuyer() async {
    defaultUser = LoggedUser(
      user: EntitiesUser(
        uid: 'NULL',
        email: 'NULL',
        password: 'NULL',
        name: 'NULL',
      ),
      type: UserTypes.buyer,
    );
    router.go('/dashboard');
    return true;
  }

  Future<bool> signUp(EntitiesUser user) async {
    final res = await ServiceUser().signUp(user);
    if (res != null) {
      router.go('/login');
      return true;
    } else {
      return false;
    }
  }
}
