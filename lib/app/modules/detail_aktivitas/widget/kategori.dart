// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../views/kategori_button.dart';

class ListKategori extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomKategoriCheckButton(
              text: "Concept",
              onPress: () {
                controller.changeConceptState();
              },
              stateValue: controller.onConcept,
            ),
            CustomKategoriCheckButton(
              text: "Design",
              onPress: () {
                controller.changeDesignState();
              },
              stateValue: controller.onDesign,
            ),
            CustomKategoriCheckButton(
              text: "Discuss",
              onPress: () {
                controller.changeDiscussState();
              },
              stateValue: controller.onDiscuss,
            ),
          ],
        ),
        Row(
          children: [
            CustomKategoriCheckButton(
              text: "Learn",
              onPress: () {
                controller.changeLearntState();
              },
              stateValue: controller.onLearn,
            ),
            CustomKategoriCheckButton(
              text: "Report",
              onPress: () {
                controller.changeReportState();
              },
              stateValue: controller.onReport,
            ),
            CustomKategoriCheckButton(
              text: "Other",
              onPress: () {
                controller.changeOtherState();
              },
              stateValue: controller.onOther,
            ),
          ],
        ),
      ],
    );
  }
}
