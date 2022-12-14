// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../modules/values/colors.dart';

class MyHelper {
  static var popupmenu = [
    "Aktivitas Tertunda",
    "Aktivitas Selesai",
    "Semua Aktivitas",
  ];

  static final myDetailAppBar = AppBar(
    title: Text(
      'Detail Aktivitas',
      style: TextStyle(
          color: MyColors.darkGrey, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    iconTheme: IconThemeData(
      color: MyColors.darkGrey,
    ),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static final kategoriappbar = AppBar(
    title: Text('Kategori'),
    centerTitle: true,
  );
}

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          color: MyColors.white2, borderRadius: BorderRadius.circular(5)),
      child: Stack(children: [CircularProgressIndicator()]),
    );
  }
}
