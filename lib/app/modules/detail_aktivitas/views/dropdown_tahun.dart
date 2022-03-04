// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

class ContentDialog extends StatefulWidget {
  @override
  State<ContentDialog> createState() => _ContentDialogState();
}

class _ContentDialogState extends State<ContentDialog> {
  final List<String> Waktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime"
  ];

  DetailAktivitasController detailC = Get.put(DetailAktivitasController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Waktu dan Tanggal",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  maxHeight: 150.0,
                  showSelectedItem: true,
                  items: [
                    "Sebelum Dzuhur",
                    "Setelah Dzuhur",
                    "Setelah Ashar",
                    "Overtime"
                  ],
                  // label: "Pilih salah satu...",
                  hint: "Pilih Waktu",
                  showAsSuffixIcons: true,
                  dropdownSearchBaseStyle: TextStyle(fontSize: 15.0),
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 243, 243),
                  ),
                  // hint: "country in menu mode",
                  // popupItemDisabled: (String s) => s.startsWith('I'),
                  // onChanged: (value) {
                  //   detailC.waktu = value.toString();
                  // },
                  // selectedItem: "Brazil"
                ),
              )
            ])));
  }
}
