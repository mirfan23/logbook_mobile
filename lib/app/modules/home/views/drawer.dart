import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/routes/app_pages.dart';

import '../../values/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 100,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              color: MyColors.white,
              border:
                  Border(bottom: BorderSide(width: 1.0, color: MyColors.blue))),
          child: Row(
            children: [
              Image(
                image: AssetImage("assets/icons/waktu.png"),
                height: 35,
                width: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Logbook App",
                style: TextStyle(color: MyColors.black, fontSize: 25),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          onTap: (() {
            Get.toNamed(AppPages.INITIAL);
          }),
          leading: Image(image: AssetImage("assets/icons/grafik.png")),
          title: Text("Laporan Aktivitas", style: TextStyle(fontSize: 15)),
        ),
        ListTile(
          onTap: () {
            Get.toNamed(AppPages.INITIAL_K);
          },
          leading: Icon(
            Icons.layers,
            size: 30,
          ),
          title: Text("Kategori", style: TextStyle(fontSize: 15)),
        ),
        Spacer(),
        ListTile(
          // Get.toNamed("logout");
          leading: Icon(
            Icons.logout,
            size: 20,
          ),
          title: Text("Keluar", style: TextStyle(fontSize: 14)),
        )
      ]),
    );
  }
}
