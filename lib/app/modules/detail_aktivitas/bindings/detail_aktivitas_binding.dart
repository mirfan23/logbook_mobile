import 'package:get/get.dart';

import '../controllers/detail_aktivitas_controller.dart';

class DetailAktivitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAktivitasController>(
      () => DetailAktivitasController(),
    );
  }
}
