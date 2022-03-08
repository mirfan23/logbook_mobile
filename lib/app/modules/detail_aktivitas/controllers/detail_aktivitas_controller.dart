// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/home_model.dart';

import '../detail_aktivitas_model.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;
  var listAktivitas = List<Homepage>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  var statusSelected = false.obs;

  Rx<DateTime> initialDate = DateTime.now().obs;
  Rx<DateTime> firstDate = DateTime(2000).obs;
  Rx<DateTime> lastDate = DateTime(2030).obs;

  RxBool onConcept = false.obs;
  RxBool onDesign = false.obs;
  RxBool onDiscuss = false.obs;
  RxBool onLearn = false.obs;
  RxBool onReport = false.obs;
  RxBool onOther = false.obs;
  RxBool onTarget = false.obs;
  RxBool dataCheck = false.obs;
  // RxString onKategoriSelected = "".obs;
  // RxString onWaktuSelected = "".obs;

  List<String> myListSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
  ].obs;

  late TextEditingController judulcontroller;
  late TextEditingController realitacontroller;
  late String kategoricontroller;
  late String subaktivitascontroller;
  late String waktucontroller;

  @override
  void onInit() {
    super.onInit();
    judulcontroller = TextEditingController();
    realitacontroller = TextEditingController();
    kategoricontroller = "";
    subaktivitascontroller = "";
    waktucontroller = "";

    var subAktivitas1 = DetailAktivitasModel(status: false, tittle: "Analisis");
    var subAktivitas2 =
        DetailAktivitasModel(status: false, tittle: "Wireframe");
    var subAktivitas3 =
        DetailAktivitasModel(status: false, tittle: "Hi-fi Design");
    var subAktivitas4 =
        DetailAktivitasModel(status: false, tittle: "Prototyping");
    var subAktivitas5 = DetailAktivitasModel(status: false, tittle: "Testing");
    var subAktivitas6 =
        DetailAktivitasModel(status: false, tittle: "Development");
    var subAktivitas7 = DetailAktivitasModel(status: false, tittle: "Bug Fix");
    listSubAktivitas.add(subAktivitas1);
    listSubAktivitas.add(subAktivitas2);
    listSubAktivitas.add(subAktivitas3);
    listSubAktivitas.add(subAktivitas4);
    listSubAktivitas.add(subAktivitas5);
    listSubAktivitas.add(subAktivitas6);
    listSubAktivitas.add(subAktivitas7);
  }

  void stateTanggal(DateTime value) {
    if (value != null) {
      initialDate.value = value;
    }
  }

  void addSubAktivitas(String tittle) {
    var subAktivitas = DetailAktivitasModel(status: false, tittle: tittle);
    listSubAktivitas.add(subAktivitas);
  }

  // void addAktivitas(String target, String realita, String kategori,
  //     String waktu, String tanggal) {
  //   var aktivitas = Homepage(
  //       id: target,
  //       status: false,
  //       target: target,
  //       realita: realita,
  //       kategori: kategori,
  //       subaktivitas: "subAktivitas",
  //       waktu: waktu,
  //       tanggal: tanggal);
  //   listAktivitas.add(aktivitas);
  // }

  void stateSubAktivitas(DetailAktivitasModel data) {
    dataCheck = data.status.obs;
    dataCheck.toggle();
    if (dataCheck.isTrue) {
      subaktivitascontroller = data.tittle.toString();
    }
    data.status = dataCheck.value;
    print(data.tittle + " = " + data.status.toString());
    change(dataCheck.value, status: RxStatus.success());
  }

  // void changeTargetToggle() {
  //   onTarget.toggle();
  //   print("onTarget : " + onTarget.toString());
  // }

  void changeConceptState() {
    onConcept.toggle();
    if (onConcept.isTrue) {
      kategoricontroller = "Concept";
      print("onConcept : " + onConcept.toString());
    }
  }

  void changeDesignState() {
    onDesign.toggle();
    if (onDesign.isTrue) {
      kategoricontroller = "Design";
      print("onDesign : " + onDesign.toString());
    }
  }

  void changeDiscussState() {
    onDiscuss.toggle();
    if (onDiscuss.isTrue) {
      kategoricontroller = "Discuss";
      print("onDiscuss : " + onDiscuss.toString());
    }
  }

  void changeLearntState() {
    onLearn.toggle();
    if (onLearn.isTrue) {
      kategoricontroller = "Learn";
      print("onLearn : " + onLearn.toString());
    }
  }

  void changeReportState() {
    onReport.toggle();
    if (onReport.isTrue) {
      kategoricontroller = "Report";
      print("onReport : " + onReport.toString());
    }
  }

  void changeOtherState() {
    onOther.toggle();
    if (onOther.isTrue) {
      kategoricontroller = "Other";
      print("onOther : " + onOther.toString());
    }
  }
}
