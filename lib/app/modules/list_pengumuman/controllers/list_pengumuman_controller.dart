import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListPengumumanController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamPengumuman() {
    Query<Map<String, dynamic>> pengumuman = firestore.collection("pengumuman").where("kategoriPenerima", isEqualTo: "Semua");
    return pengumuman.snapshots();
  }
}
