// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/values/colors.dart';

import '../controllers/detail_aktivitas_controller.dart';

class ListKategori extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    var listKategoriCard =
        List.generate(controller.listKategori.length, (int index) {
      return listKategoriIndex(controller.listKategori[index], index + 1);
    });
    return GridView.count(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 2 / .7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: listKategoriCard);
  }

  Widget listKategoriIndex(String title, int index) {
    return Container(
      child: Obx(() => ElevatedButton(
          onPressed: () {
            controller.selectedKategori.value = index;
            controller.kategoricontroller = title;
          },
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: MyColors.blue),
              shadowColor: MyColors.white,
              primary: controller.selectedKategori.value == index
                  ? MyColors.blue
                  : MyColors.white),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: controller.selectedKategori.value == index
                    ? MyColors.white
                    : MyColors.black),
          ))),
    );
  }
}
