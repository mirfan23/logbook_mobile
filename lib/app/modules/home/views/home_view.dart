// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/views/bulan_view.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';
import '../../../routes/app_pages.dart';
import '../../values/colors.dart';
import '../controllers/home_controller.dart';
import 'drawer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = Get.height;
    // final deviceWidth = Get.width;
    final bodyHeight =
        deviceHeight - MyHelper.myDetailAppBar.preferredSize.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Akivitasku'),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              icon: Image(
                image: AssetImage("assets/icons/filter.png"),
                height: 25,
                width: 25,
              ),
              onSelected: (item) {
                onSelected(context, item, controller);
              },
              itemBuilder: (context) =>
                  [...MyHelper.popupmenu.map(buildItem).toList()],
            )
          ],
        ),
        drawer: MyDrawer(),
        body: BulanView(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: MaterialButton(
              height: bodyHeight * 0.09,
              color: MyColors.blue,
              onPressed: () {
                Get.toNamed(AppPages.INITIAL_D, arguments: [
                  {"edit": false}
                ]);
              },
              child: Text("+ Tambah Aktivitas",
                  style: TextStyle(color: MyColors.white, fontSize: 20))),
        ));
  }
}

void onSelected(BuildContext context, String item, HomeController controller) {
  switch (item) {
    case "Aktivitas Tertunda":
      // controller.listData.value = controller.getDataByStatus(
      //     false, controller.formatDate(controller.selectedDay.value));
      controller.getDataByStatus(
        false,
        controller.formatDate(
          controller.selectedDay.value,
        ),
      );
      print("===========tertunda===========");
      print(item);
      print(controller.formatDate(controller.selectedDay.value));
      break;

    case "Aktivitas Selesai":
      // controller.listData.value = controller.getDataByStatus(
      //     true, controller.formatDate(controller.selectedDay.value));
      controller.getDataByStatus(
          true, controller.formatDate(controller.selectedDay.value));
      print("===========selesai===========");
      print(item);
      print(controller.formatDate(controller.selectedDay.value));
      break;

    case "Semua Aktivitas":
      controller
          .getDataByDate(controller.formatDate(controller.selectedDay.value));
      print("======================");
      print(item);
      break;
  }
}

PopupMenuItem<String> buildItem(String e) {
  return PopupMenuItem(
      value: e,
      child: Text(
        e,
        style: TextStyle(color: MyColors.black),
      ));
}
