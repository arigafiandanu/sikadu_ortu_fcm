import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RekapNilaiController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var kelas = Get.arguments['id'];


  Stream<QuerySnapshot<Map<String, dynamic>>> streamLecture(
      String kelas) async* {
    //maybe use in future
    // var waliKelas = await firestore
    //     .collection("Guru")
    //     .doc(auth.currentUser!.email)
    //     .get()
    //     .then((value) => value.data()?['mengajarKelas']);

    var mataPelajaran =
        firestore.collection("pelajaran").where("kelas", isEqualTo: kelas);

   yield* mataPelajaran.snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamLectureFinal(
      String kelas) async* {
    //maybe use in future
    // var waliKelas = await firestore
    //     .collection("Guru")
    //     .doc(auth.currentUser!.email)
    //     .get()
    //     .then((value) => value.data()?['mengajarKelas']);

    var mataPelajaran =
        firestore.collection("pelajaran").where("kelas", isEqualTo: kelas);

    yield* mataPelajaran.snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamGrade() async* {
    var email = FirebaseAuth.instance.currentUser?.email;
    var mataPelajaran = firestore.collection("Siswa").doc(email);

    yield* mataPelajaran.snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamGradeFinal() async* {
    var email = FirebaseAuth.instance.currentUser?.email;
    var mataPelajaran = firestore.collection("Siswa").doc(email);

    yield* mataPelajaran.snapshots();
  }

  @override
  void dispose() {
    // streamLectureMid(kelas);
    streamLectureFinal(kelas);
    // streamGradeMid();
    streamGradeFinal();
    super.dispose();
  }
}
