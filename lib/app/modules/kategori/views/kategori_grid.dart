import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/values/colors.dart';

class KategoriGrid extends StatelessWidget {
  const KategoriGrid({
    required this.image,
    required this.tittle,
    required this.aktivitascount,
  });

  final String image;
  final String tittle;
  final int aktivitascount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
          color: MyColors.white, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(25),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image(height: 70, width: 70, image: AssetImage(image)),
          Spacer(),
          Text(
            tittle,
            style: TextStyle(color: MyColors.black, fontSize: 20),
          ),
          Row(
            children: [
              Text(
                "Aktivitas",
                style: TextStyle(color: MyColors.grey, fontSize: 15),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                aktivitascount.toString(),
                style: TextStyle(
                    color: MyColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ),
    );
  }
}
