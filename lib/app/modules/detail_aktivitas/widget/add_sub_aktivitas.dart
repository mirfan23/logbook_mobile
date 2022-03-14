import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class ButtonAddSubAktivitasWidget extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    var addSubAktivitasController = TextEditingController();
    return Container(
        width: double.infinity,
        child: MaterialButton(
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 15,
                color: MyColors.lightGrey,
              ),
              Text(
                "Tambah Sub-Aktivitas",
                style: TextStyle(color: MyColors.lightGrey),
              ),
            ],
          ),
          onPressed: () {
            dialogMethod(context, addSubAktivitasController);
          },
        ));
  }

  Future<dynamic> dialogMethod(
      BuildContext context, TextEditingController addSubAktivitasController) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: MyColors.white,
          insetAnimationCurve: Curves.easeInOut,
          insetAnimationDuration: Duration(milliseconds: 500),
          insetPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), side: BorderSide.none),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: addSubAktivitasController,
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                            fillColor: MyColors.white2),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: MyColors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: MaterialButton(
                        onPressed: () {
                          controller
                              .addSubAktivitas(addSubAktivitasController.text);
                          Navigator.pop(context);
                        },
                        child: Text("Tambah Sub-Aktivitas",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
