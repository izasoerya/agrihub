import 'package:agrihub_new/domain/entities/e_marker.dart';
import 'package:agrihub_new/domain/infrastructure/i_marker.dart';
import 'package:agrihub_new/utils/default_user.dart';

class ServiceMarker {
  Future<Set<EntitiesMarker>> fetchListMarker(String uid) async {
    final res =
        await InfrastructureMarker(defaultUser.type).readListMarker(uid);
    return res.where((e) => e != null).map((e) => e!).toSet();
  }

  Future<EntitiesMarker> fetchMarker(String uidMarker) async {
    final res =
        await InfrastructureMarker(defaultUser.type).readMarker(uidMarker);
    return res!;
  }

  Future<void> addMarker(EntitiesMarker marker) async {
    await InfrastructureMarker(defaultUser.type).createMarker(marker);
  }

  Future<void> updateMarker(EntitiesMarker marker) async {
    await InfrastructureMarker(defaultUser.type).updateMarker(marker);
  }

  Future<void> deleteMarker(EntitiesMarker marker) async {
    await InfrastructureMarker(defaultUser.type).deleteMarker(marker);
  }

  Future<void> testDeleteImageMarker() async {
    await InfrastructureMarker(defaultUser.type).testDeleteImageMarker();
  }
}
