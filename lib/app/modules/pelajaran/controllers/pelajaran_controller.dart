import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PelajaranController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamPelajaran() async* {
    var kelas = await firestore
        .collection("Siswa")
        .doc(auth.currentUser!.email)
        .get()
        .then((value) => value.data()?['kelas']);

    var mataPelajaran =
        firestore.collection("pelajaran").where("kelas", isEqualTo: kelas);

    yield* mataPelajaran.snapshots();
  }
}
