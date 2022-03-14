// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../detail_aktivitas_model.dart';

class SubAktivitasWidget extends GetView<DetailAktivitasController> {
  const SubAktivitasWidget({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final DetailAktivitasModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Obx(() {
        var test = controller.dataCheck.value;
        return Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 25,
                      height: 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.white2),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 25,
                      height: 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.white2),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: MyColors.white2,
                      borderRadius: BorderRadius.circular(2)),
                  child: Checkbox(
                      side: BorderSide(style: BorderStyle.none),
                      onChanged: (_) {
                        controller.stateSubAktivitas(data);
                      },
                      value: data.status),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.tittle,
                  style: TextStyle(
                    color: data.status ? MyColors.grey : MyColors.black,
                    decoration: data.status
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 0.8,
              color: MyColors.blue,
            ),
          ],
        );
      }),
    );
  }
}
