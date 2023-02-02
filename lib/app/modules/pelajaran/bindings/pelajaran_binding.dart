import 'package:get/get.dart';

import '../controllers/pelajaran_controller.dart';

class PelajaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelajaranController>(
      () => PelajaranController(),
    );
  }
}
