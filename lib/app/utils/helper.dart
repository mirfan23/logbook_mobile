// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../modules/values/colors.dart';

class MyHelper {
  static final Myappbar = AppBar(
    title: Text('Akivitasku'),
    centerTitle: true,
    // leading: Icon(Icons.menu),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image(
            height: 25,
            width: 25,
            image: AssetImage("assets/icons/filter.png")),
      )
    ],
  );

  static final DetailAppbar = AppBar(
    title: Text(
      'Detail Aktivitas',
      style: TextStyle(
          color: MyColors.darkGrey, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    iconTheme: IconThemeData(
      color: MyColors.darkGrey, //change your color here
    ),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static final myDetailAppBar = AppBar(
    title: Text(
      'Detail Aktivitas',
      style: TextStyle(
          color: MyColors.darkGrey, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    iconTheme: IconThemeData(
      color: MyColors.darkGrey, //change your color here
    ),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
