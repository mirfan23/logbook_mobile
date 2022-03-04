import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/views/bulan_view.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';
import '../../../routes/app_pages.dart';
import '../../values/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = Get.height;
    final deviceWidth = Get.width;
    final bodyHeight = deviceHeight - MyHelper.Myappbar.preferredSize.height;
    return Scaffold(
        appBar: MyHelper.Myappbar,
        body: BulanView(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15),
          child: MaterialButton(
              height: bodyHeight * 0.1,
              color: MyColors.blue,
              onPressed: () {
                Get.toNamed(AppPages.INITIAL_D);
              },
              child: Text("+ Tambah Aktivitas",
                  style: TextStyle(color: MyColors.white, fontSize: 20))),
        ));
  }
}
