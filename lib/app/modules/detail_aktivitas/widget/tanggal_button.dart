import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class TanggalButton extends StatelessWidget {
  const TanggalButton({
    Key? key,
    required this.controller,
    // required this.tanggal,
  }) : super(key: key);

  final DetailAktivitasController controller;
  // final TextEditingController tanggal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:
          // Obx(() {
          //   return
          MaterialButton(
        height: 50,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: MyColors.blue)),
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: controller.initialDate.value,
                  firstDate: controller.firstDate.value,
                  lastDate: controller.lastDate.value)
              .then((value) {
            controller.stateTanggal(value!);
          });
        },
        child: Row(
          children: [
            Obx(
              () => Text(
                DateFormat.EEEE().format(controller.initialDate.value) +
                    ", " +
                    DateFormat("dd MMMM yyyy")
                        .format(controller.initialDate.value),
                style: TextStyle(
                    color: MyColors.darkGrey, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Icon(Icons.date_range)
          ],
        ),
      ),
      // }),
    );
  }
}
