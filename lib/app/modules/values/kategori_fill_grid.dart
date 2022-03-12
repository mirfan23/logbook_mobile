import 'package:flutter/cupertino.dart';
import 'package:logbook_mobile_app/app/modules/kategori/views/kategori_grid.dart';
import 'dart:math' as math;

class FillKategoriGrid {
  static final EdgeInsets paddingBody = EdgeInsets.all(25.0);

  static var listKategoritittle = [
    "Discuss",
    "Concept",
    "Learn",
    "Report",
    "Design",
    "Other",
  ];

  static var listIconKategori = [
    "assets/icons/Discuss.png",
    "assets/icons/Concept.png",
    "assets/icons/Learn.png",
    "assets/icons/Report.png",
    "assets/icons/Design.png",
    "assets/icons/Other.png",
  ];
  static var listKategori =
      List<Widget>.generate(listKategoritittle.length, (int index) {
    return Container(
      child: KategoriGrid(
        image: listIconKategori[index],
        tittle: listKategoritittle[index],
        aktivitascount: math.Random().nextInt(listKategoritittle.length),
      ),
    );
  });
}
