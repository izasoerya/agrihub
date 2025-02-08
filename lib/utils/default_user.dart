import 'package:agrihub_new/domain/entities/e_user.dart';
import 'package:agrihub_new/utils/enumerator.dart';

class LoggedUser {
  final EntitiesUser user;
  final UserTypes type;

  LoggedUser({required this.user, required this.type});
}

LoggedUser defaultUser = LoggedUser(
  user: EntitiesUser(
    uid: 'NULL',
    email: 'NULL',
    password: 'NULL',
    name: 'NULL',
  ),
  type: UserTypes.buyer,
);

// EntitiesUser defaultUser = EntitiesUser(
//   uid: 'NULL',
//   email: 'NULL',
//   password: 'NULL',
//   name: 'NULL',
// );
