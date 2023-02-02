import 'package:get/get.dart';

import '../controllers/informasi_lainnya_controller.dart';

class InformasiLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformasiLainnyaController>(
      () => InformasiLainnyaController(),
    );
  }
}
