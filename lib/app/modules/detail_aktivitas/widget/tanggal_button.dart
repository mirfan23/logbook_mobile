import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class TanggalButton extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (_) => Container(
              width: double.infinity,
              child: MaterialButton(
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
                            color: MyColors.darkGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.date_range)
                  ],
                ),
              ),
            ),
        onLoading: WidgetLoading(height: 50));
  }
}
