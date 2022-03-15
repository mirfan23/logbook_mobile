import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/widget/waktu_detail.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../views/list_sub_aktivitas.dart';
import '../widget/add_sub_aktivitas.dart';
import '../widget/detail_body.dart';
import '../widget/list_kategori.dart';
import '../widget/tanggal_button.dart';
import '../widget/text_field.dart';
import '../widget/title.dart';

class BodyDetailAktivitas extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Tittle(
            tittle: "Target/Ekspektrasi",
          ),
          SizedBox(
            height: 10,
          ),
          DetailBody(),
          SizedBox(
            height: 30,
          ),
          Tittle(tittle: "Realita"),
          SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(),
          SizedBox(
            height: 10,
          ),
          Tittle(tittle: "Kategori"),
          SizedBox(
            height: 10,
          ),
          ListKategori(),
          SizedBox(
            height: 20,
          ),
          Tittle(tittle: "Sub-Aktivitas"),
          ListDataSubAktivitas(),
          ButtonAddSubAktivitasWidget(),
          SizedBox(
            height: 10,
          ),
          Tittle(tittle: "Waktu & Tanggal"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              WaktuDetialAktivitasWidget(),
              SizedBox(
                height: 10,
              ),
              TanggalButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget listKategoriIndex(String tittle, int index) {
    return Container(
        child: Obx(
      () => ElevatedButton(
        onPressed: () {
          controller.selectedKategori.value = index;
          controller.kategoricontroller = tittle;
        },
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: MyColors.blue),
            shadowColor: MyColors.white,
            primary: controller.selectedKategori.value == index
                ? MyColors.blue
                : MyColors.white),
        child: Text(
          tittle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: controller.selectedKategori.value == index
                  ? MyColors.white
                  : MyColors.black),
        ),
      ),
    ));
  }
}
