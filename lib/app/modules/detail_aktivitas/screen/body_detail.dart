import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../views/list_sub_aktivitas.dart';
import '../widget/add_sub_aktivitas.dart';
import '../widget/detail_body.dart';
import '../widget/kategori.dart';
import '../widget/tanggal_button.dart';
import '../widget/text_field.dart';
import '../widget/title.dart';

class BodyDetailAktivitas extends StatelessWidget {
  BodyDetailAktivitas({
    Key? key,
    required this.controller,
    // required this.target,
    // required this.realita,
    // required this.kategori,
    // required this.tanggal,
  }) : super(key: key);

  // final TextEditingController target;
  // final TextEditingController realita;
  // final TextEditingController kategori;
  // final TextEditingController tanggal;

  final DetailAktivitasController controller;
  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
  ];

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
          ListDataSubAktivitas(
            controller: controller,
          ),
          ButtonAddSubAktivitasWidget(controller: controller),
          SizedBox(
            height: 10,
          ),
          Tittle(tittle: "Waktu & Tanggal"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              // WaktuButtonDetailAktivitasScreen(controller: controller),
              DropdownSearch<String>(
                mode: Mode.DIALOG,
                maxHeight: 225,
                dropdownSearchTextAlignVertical: TextAlignVertical.center,
                showSelectedItem: true,
                items: itemListWaktu,
                selectedItem: "Pilih waktu...",
                hint: "Pilih waktu...",
                onChanged: (value) {
                  controller.waktucontroller = value.toString();
                },
                showAsSuffixIcons: false,
                dropdownSearchDecoration: InputDecoration(
                    hoverColor: MyColors.blue,
                    fillColor: Colors.red,
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: MyColors.blue))),
              ),
              SizedBox(
                height: 10,
              ),
              TanggalButton(
                controller: controller,
                // tanggal: tanggal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
