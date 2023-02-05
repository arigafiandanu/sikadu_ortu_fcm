import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/rekap_nilai_controller.dart';

class RekapNilaiView extends GetView<RekapNilaiController> {
  var kelas = Get.arguments['id'];
  List<Tab> myTab = const [
    Tab(
      text: "Semester 1",
    ),
    Tab(
      text: "Semester 2",
    )
  ];

  RekapNilaiView({Key? key}) : super(key: key);
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
        title: Text(
          'Rekap Nilai $kelas',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DefaultTabController(
            length: myTab.length,
            child: Column(
              children: [
                TabBar(
                  tabs: myTab,
                  labelColor: Colors.black,
                ),
                SizedBox(
                  height: Get.height * 0.85,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: controller.streamLecture(kelas),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Text("Waiting data lecture"),
                          );
                        }
                        if (snapshot.hasData) {
                          return StreamBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                              stream: controller.streamGrade(),
                              builder: ((context, snapshotGrade) {
                                if (snapshotGrade.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: Text("waiting grade"),
                                  );
                                }
                                if (snapshotGrade.hasData) {
                                  var dataPelajaran = snapshot.data!.docs;
                                  var gradeData = snapshotGrade.data;

                                  var gradeMid =
                                      gradeData?['nilai'][kelas]?['semester 1'];

                                  print(gradeMid);
                                  print("isi grade middddddd");
                                  var gradeFinal =
                                      gradeData?['nilai'][kelas]?['semester 2'];

                                  // var gradeUts = grade?['nilaiUts'] ?? "0";
                                  // var gradeSemester =
                                  //     grade?['nilaiSemester'] ?? "0";

                                  return TabBarView(children: [
                                    // Tab semester 1

                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                width: Get.width / 2,
                                                child: const Text(
                                                  "Mata Pelajaran",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                width: Get.width / 4,
                                                child: const Text(
                                                  "PTS",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                width: Get.width / 4,
                                                child: const Text(
                                                  "PAS",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        gradeMid != null
                                            ? _showGradeMid(
                                                dataPelajaran, gradeData!)
                                            : Expanded(
                                                child: ListView(
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 4,
                                                    ),
                                                    Center(
                                                      child: SizedBox(
                                                        height:
                                                            Get.height * 0.2,
                                                        width: Get.width * 0.4,
                                                        child: Lottie.asset(
                                                          "assets/lottie/empty_grade.json",
                                                        ),
                                                      ),
                                                    ),
                                                    const Center(
                                                      child: Text(
                                                        "Nilai Saat ini masih kosong",
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                      ],
                                    ),

                                    // Tab semester 2
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                width: Get.width / 2,
                                                child: const Text(
                                                  "Mata Pelajaran",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                width: Get.width / 4,
                                                child: const Text(
                                                  "PTS",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                width: Get.width / 4,
                                                child: const Text(
                                                  "PAS",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        gradeFinal != null
                                            ? _showGradeFinal(
                                                dataPelajaran, gradeData!)
                                            : Expanded(
                                                child: ListView(
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 4,
                                                    ),
                                                    Center(
                                                      child: SizedBox(
                                                        height:
                                                            Get.height * 0.2,
                                                        width: Get.width * 0.4,
                                                        child: Lottie.asset(
                                                          "assets/lottie/empty_grade.json",
                                                        ),
                                                      ),
                                                    ),
                                                    const Center(
                                                      child: Text(
                                                        "Nilai Saat ini masih kosong",
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                      ],
                                    ),
                                  ]);
                                } else {
                                  return const Center(
                                    child: Text("error grade"),
                                  );
                                }
                              }));
                        } else {
                          return Text("Data lecture error");
                        }
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _showGradeFinal(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dataPelajaran,
      DocumentSnapshot<Map<String, dynamic>> gradeData) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataPelajaran.length,
        itemBuilder: ((context, index) {
          var dataPelajaranIndex = dataPelajaran[index].data();
          var pelajaran = dataPelajaranIndex['pelajaran'];
          var grade = gradeData['nilai'][kelas]?['semester 2']?[pelajaran];
          var pts = grade?['PTS'] ?? "0";
          var pas = grade?['PAS'] ?? "0";

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 250,
            color: Colors.blue.withOpacity(0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      width: Get.width / 2,
                      child: Text(
                        "${dataPelajaranIndex['pelajaran']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: Get.width / 5,
                      child: Text(
                        pts.toString(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: Get.width / 5,
                      child: Text(
                        pas.toString(),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  width: Get.width,
                  child: const Text(
                    "Catatan : ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  height: Get.width / 5,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  color: Colors.white,
                  alignment: Alignment.topLeft,
                  child: Text(
                    grade?['catatanGuru'] ?? "Belum ada catatan",
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Expanded _showGradeMid(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dataPelajaran,
      DocumentSnapshot<Map<String, dynamic>> gradeData) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataPelajaran.length,
        itemBuilder: ((context, index) {
          var dataPelajaranIndex = dataPelajaran[index].data();
          var pelajaran = dataPelajaranIndex['pelajaran'];

          var grade = gradeData['nilai'][kelas]?['semester 1']?[pelajaran];
          var pts = grade?['PTS'] ?? "0";
          var pas = grade?['PAS'] ?? "0";

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 250,
            color: Colors.blue.withOpacity(0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      width: Get.width / 2,
                      child: Text(
                        "${dataPelajaranIndex['pelajaran']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: Get.width / 5,
                      child: Text(
                        pts.toString(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: Get.width / 5,
                      child: Text(
                        pas.toString(),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  width: Get.width,
                  child: const Text(
                    "Catatan : ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  height: Get.width / 5,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  color: Colors.white,
                  alignment: Alignment.topLeft,
                  child: Text(
                    grade?['catatanGuru'] ?? "Belum ada catatan",
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
