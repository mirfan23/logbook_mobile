import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/views/drawer.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.kategoriappbar,
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          'KategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
