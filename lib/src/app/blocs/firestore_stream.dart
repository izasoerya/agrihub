import 'package:agrihub/src/domain/entities/e_plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FirestoreEvent {}

class ToggleFirestoreEvent extends FirestoreEvent {
  final List<EntitiesPlant?> documents;

  ToggleFirestoreEvent({required this.documents});
}

class FirestoreState {
  final List<EntitiesPlant?> doc;

  FirestoreState({required this.doc});
}

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreBloc() : super(FirestoreState(doc: [null])) {
    on<ToggleFirestoreEvent>((event, emit) {
      emit(FirestoreState(doc: event.documents));
    });
    _listenFirestore();
  }

  Future<void> _listenFirestore() async {
    try {
      FirebaseFirestore.instance
          .collection('plant')
          .snapshots()
          .listen((snapshot) {
        final documents = snapshot.docs.map((doc) {
          final data = doc.data();
          return EntitiesPlant.fromJson(data);
        }).toList();
        add(ToggleFirestoreEvent(documents: documents));
        print('Firestore: $documents');
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}
