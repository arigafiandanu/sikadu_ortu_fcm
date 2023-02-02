import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pelajaran_controller.dart';

class PelajaranView extends GetView<PelajaranController> {
  const PelajaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Pelajaran',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamPelajaran(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Waitting"),
              );
            }
            if (snapshot.hasData) {
              var data = snapshot.data?.docs;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: ((context, index) {
                  var pelajaran = data?[index].data();
                  return Card(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    borderOnForeground: true,
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      onTap: () {},
                      title: Text(pelajaran?['pelajaran']),
                      trailing: const Icon(Icons.arrow_right),
                      style: ListTileStyle.list,
                      tileColor: Colors.green[50],
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          }),
        ));
  }
}
