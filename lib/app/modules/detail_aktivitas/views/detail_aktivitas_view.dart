// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/screen/body_detail.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/helper.dart';
import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../widget/custom_button.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.blue,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {
          if (controller.checkValueIsValid()) {
            controller.addAktivitases();
            Get.offAllNamed(AppPages.INITIAL);
          } else {
            print("Data harus terisi semua!");
          }
        },
      ),
      body: BodyDetailAktivitas(),
    );
  }
}
