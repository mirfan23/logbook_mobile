// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:logbook_mobile_app/app/modules/home/home_model.dart';

import '../../../utils/helper.dart';
import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../screen/body_detail.dart';
import '../widget/custom_button.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  var HomeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.blue,
        borderRadius: 5,
        textColor: MyColors.white,
        onPressed: () {
          print(controller.judulcontroller.text);
          print(controller.realitacontroller.text);
          print(controller.kategoricontroller);
          print(controller.subaktivitascontroller);
          print(controller.waktucontroller);
          print(HomeC.formatDate(controller.initialDate.value));
          var aktivtas = Homepage(
              id: (HomeC.listAktivitas.length + 1).toString(),
              status: false,
              target: controller.judulcontroller.text,
              realita: controller.realitacontroller.text,
              kategori: controller.kategoricontroller,
              subaktivitas: controller.subaktivitascontroller,
              waktu: controller.waktucontroller,
              tanggal: HomeC.formatDate(controller.initialDate.value));
          HomeC.listAktivitas.add(aktivtas);
          Get.back();
        },
      ),
      body: BodyDetailAktivitas(
        controller: controller,
      ),
    );
  }
}
