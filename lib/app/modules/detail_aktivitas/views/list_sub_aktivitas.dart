import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_aktivitas_controller.dart';
import 'sub_aktivitas_widget.dart';

class ListDataSubAktivitas extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(() {
        return controller.listSubAktivitas.isEmpty
            ? Container()
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listSubAktivitas.length,
                itemBuilder: (context, index) {
                  final listData = controller.listSubAktivitas[index];
                  return SubAktivitasWidget(
                    data: listData,
                    index: index,
                  );
                },
              );
      }),
    );
  }
}
