import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import '../../values/colors.dart';

class CustomTextFieldWidget extends GetView<DetailAktivitasController> {
  const CustomTextFieldWidget({
    Key? key,
    // required this.controller,
    // required this.realita,
  }) : super(key: key);

  // final DetailAktivitasController controller;
  // final TextEditingController realita;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.realitacontroller,
      decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: MyColors.white2),
      maxLines: 5,
      style: TextStyle(fontWeight: FontWeight.w600, color: MyColors.darkGrey),
    );
  }
}
