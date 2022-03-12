import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/views/drawer.dart';
import 'package:logbook_mobile_app/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';

class KategoriGrid extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.kategoriappbar,
      drawer: MyDrawer(),
    );
  }
}
