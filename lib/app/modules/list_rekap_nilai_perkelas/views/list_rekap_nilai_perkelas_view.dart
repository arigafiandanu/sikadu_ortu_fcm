import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/list_rekap_nilai_perkelas_controller.dart';

class ListRekapNilaiPerkelasView
    extends GetView<ListRekapNilaiPerkelasController> {
  const ListRekapNilaiPerkelasView({Key? key}) : super(key: key);
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
          'Rekap Nilai',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 1"},
                );
              },
              title: const Text("Nilai Kelas 1"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 2"},
                );
              },
              title: const Text("Nilai Kelas 2"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 3"},
                );
              },
              title: const Text("Nilai Kelas 3"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 4"},
                );
              },
              title: const Text("Nilai Kelas 4"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 5"},
                );
              },
              title: const Text("Nilai Kelas 5"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            borderOnForeground: true,
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.REKAP_NILAI,
                  arguments: {"id": "Kelas 6"},
                );
              },
              title: const Text("Nilai Kelas 6"),
              trailing: const Icon(Icons.arrow_right),
              style: ListTileStyle.list,
              tileColor: Colors.blue[50],
            ),
          ),
        ],
      ),
    );
  }
}
