import 'package:get/get.dart';

import '../controllers/rekap_nilai_controller.dart';

class RekapNilaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapNilaiController>(
      () => RekapNilaiController(),
    );
  }
}
