import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataDiriController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // maybe use in future
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String? email = auth.currentUser!.email;

    yield* firestore.collection("Siswa").doc(email).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> futureDetailProfil() async {
    DocumentReference<Map<String, dynamic>> ortu =
        firestore.collection("Siswa").doc(auth.currentUser!.email);

    return ortu.get();
  }
}
