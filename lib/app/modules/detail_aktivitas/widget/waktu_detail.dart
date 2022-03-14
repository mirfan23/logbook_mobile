import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class WaktuDetialAktivitasWidget extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.DIALOG,
      maxHeight: 225,
      dropdownSearchTextAlignVertical: TextAlignVertical.center,
      showSelectedItem: true,
      items: controller.itemListWaktu,
      selectedItem: "Pilih waktu...",
      onChanged: (value) {
        controller.waktucontroller = value.toString();
        print(controller.waktucontroller.toString());
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
    );
  }
}
