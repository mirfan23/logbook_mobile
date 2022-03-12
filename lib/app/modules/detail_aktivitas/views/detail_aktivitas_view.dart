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
  final homepageC = Get.put(HomeController());

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
          print("Id = ${(homepageC.listAktivitas.length + 1).toString()}\n" +
              "Status = false\n" +
              "Target = ${controller.judulcontroller.text}\n" +
              "Realita = ${controller.realitacontroller.text}\n" +
              "Kategori = ${controller.kategoricontroller.toString()}\n" +
              "Sub-Aktivitas = ${controller.subaktivitascontroller}\n" +
              "Waktu = ${controller.waktucontroller.toString()}\n" +
              "Tanggal = ${controller.formatDate(controller.initialDate.value).toString()}\n===========================");
          if (controller.checkValueIsValid()) {
            controller.addAktivitas();
            Get.back();
          } else {
            print("Data harus terisi semua!");
          }
        },
      ),
      body: BodyDetailAktivitas(
        controller: controller,
      ),
    );
  }
}
