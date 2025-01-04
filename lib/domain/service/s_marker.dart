import 'package:agrihub_new/domain/entities/e_marker.dart';
import 'package:agrihub_new/domain/infrastructure/i_marker.dart';

class ServiceMarker {
  Future<Set<EntitiesMarker>> fetchListMarker(String uid) async {
    final res = await InfrastructureMarker().readListMarker(uid);
    return res.where((e) => e != null).map((e) => e!).toSet();
  }

  Future<EntitiesMarker> fetchMarker(String uidMarker) async {
    final res = await InfrastructureMarker().readMarker(uidMarker);
    return res!;
  }

  Future<void> addMarker(EntitiesMarker marker) async {
    await InfrastructureMarker().createMarker(marker);
  }

  Future<void> updateMarker(EntitiesMarker marker) async {
    await InfrastructureMarker().updateMarker(marker);
  }

  Future<void> deleteMarker(EntitiesMarker marker) async {
    await InfrastructureMarker().deleteMarker(marker);
  }

  Future<void> testDeleteImageMarker() async {
    await InfrastructureMarker().testDeleteImageMarker();
  }
}
