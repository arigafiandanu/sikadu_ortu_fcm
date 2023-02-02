import 'package:get/get.dart';

import '../controllers/list_rekap_nilai_perkelas_controller.dart';

class ListRekapNilaiPerkelasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRekapNilaiPerkelasController>(
      () => ListRekapNilaiPerkelasController(),
    );
  }
}
