// ignore_for_file: unused_local_variable

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/home_model.dart';
import 'package:logbook_mobile_app/app/routes/app_pages.dart';

import '../../values/colors.dart';
import '../controllers/home_controller.dart';

class Aktivitas extends GetView<HomeController> {
  Aktivitas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return controller.obx((data) {
      return data!.isEmpty
          ? Container(
              width: deviceWidth,
              child: Image(image: AssetImage("assets/images/kosong.png")),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SlidableWidget(
                  data: data[index],
                  indexData: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: data.length);
    }, onLoading: CircularProgressIndicator());
  }
}

class SlidableWidget extends GetView<HomeController> {
  SlidableWidget({
    required this.data,
    required this.indexData,
  });

  final Homepage data;
  final int indexData;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            print(data.id);
            Get.toNamed(AppPages.INITIAL_D, arguments: data.id);
          },
          icon: Icons.edit,
          backgroundColor: MyColors.amber,
          foregroundColor: MyColors.white,
          label: "Edit",
        ),
        SlidableAction(
          onPressed: (context) {
            print(indexData);
            controller.deleteAktivitas(data.id);
          },
          icon: Icons.delete,
          backgroundColor: MyColors.red,
          foregroundColor: MyColors.white,
          label: "Delete",
        ),
      ]),
      child: CardListViewWidget(
        data: data,
      ),
    );
  }
}

class CardListViewWidget extends GetView<HomeController> {
  CardListViewWidget({
    required this.data,
  });
  final Homepage data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Obx(() {
        var test = controller.statusCheck.value;
        return Column(
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: MyColors.white2,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Checkbox(
                    onChanged: (state) {
                      controller.stateAktivitas(data);
                    },
                    side: BorderSide.none,
                    value: data.status,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.target.toString(),
                  style: TextStyle(
                      decoration: data.status
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: data.status ? MyColors.lightGrey : MyColors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    data.realita.toString(),
                    style: TextStyle(color: MyColors.lightGrey, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: MyColors.blue,
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data.waktu.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: MyColors.lightGrey),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors
                          .myListKategoriColor[math.Random().nextInt(3)]),
                  child: Text(
                    data.kategori.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: MyColors.lightGrey,
                    ),
                  ),
                )
              ]),
            )
          ],
        );
      }),
    );
  }
}
