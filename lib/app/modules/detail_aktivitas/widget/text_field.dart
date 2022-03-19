import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';
import '../../values/colors.dart';

class CustomTextFieldWidget extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (_) => TextField(
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
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: MyColors.darkGrey),
            ),
        onLoading: WidgetLoading(height: 100));
  }
}
