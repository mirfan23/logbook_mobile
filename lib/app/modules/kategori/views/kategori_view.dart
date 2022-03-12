import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/views/drawer.dart';
import 'package:logbook_mobile_app/app/modules/values/colors.dart';
import 'package:logbook_mobile_app/app/modules/values/kategori_fill_grid.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.kategoriappbar,
      drawer: MyDrawer(),
      body: Container(
        color: MyColors.white2,
        child: GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: FillKategoriGrid.listKategori),
      ),
    );
  }
}
