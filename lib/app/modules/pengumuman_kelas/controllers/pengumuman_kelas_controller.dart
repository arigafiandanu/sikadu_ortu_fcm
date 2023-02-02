import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class PengumumanKelasController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamPengumuman() async* {
    var kelas = await firestore
        .collection("Siswa")
        .doc(auth.currentUser!.email)
        .get()
        .then((value) => value.data()?['kelas']);
      
    // await firestore.collection('users').get().then((value) async {
    //   value.docs.forEach((element) async {
        
    //     await firestore.collection('users').doc(element['email']).get().then((value) async {
    //       log("${element['email']} isinya");
    //       log(value.data()?['token'].toString() ?? 'null');

    //       String? tokens = value.data()?['token'].toString() ?? 'null';

    //       if (tokens == 'null') {
    //         return;
    //       }

    //       final body = {
    //         "to":tokens,
    //         "notification":{
    //             "title": "coba pengumuman broadcast",
    //             "body": "isi"
    //         }
    //       };
          
    //       var response = await post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
    //       headers: {
    //         HttpHeaders.contentTypeHeader: 'application/json',
    //         HttpHeaders.authorizationHeader :'key=AAAAWagXVEs:APA91bH8J8gWqCq7QqbBBe-NeZtgdjrQ5Fr1WXjXZCsw31IgLdw6pOw6CjDlYnxn3M5x7F3yNaBlqTGzZLruVkiS4BVF6SqJLWwtubpuo_cyNypaDlslNDHuBT8HGPEiKIitCqJTAur8'
    //       },
    //           body: jsonEncode(body));
          
    //       log(response.body.toString());
    //     });
    //   });
    // });


    

    Query<Map<String, dynamic>> pengumuman = firestore
        .collection("pengumuman")
        .where("kategoriPenerima", isEqualTo: kelas);
    yield* pengumuman.snapshots();
  }
}
