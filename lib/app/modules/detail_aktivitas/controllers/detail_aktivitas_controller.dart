// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logbook_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:logbook_mobile_app/app/modules/home/home_model.dart';
import '../../home/provider/home_provider.dart';
import '../detail_aktivitas_model.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;

  var homepageC = Get.put(HomeController());

  RxBool listCheckSubAktivitas = false.obs;
  RxBool statusSelected = false.obs;
  RxInt selectedKategori = 0.obs;

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

  HomeProvider dsds = Get.put(HomeProvider());

  List<String> myListSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
  ].obs;

  final List<String> listKategori = [
    "Concept",
    "Design",
    "Discuss",
    "Learn",
    "Report",
    "Other",
  ];
  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
  ];

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

  String formatDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy");
    return formatDate.format(date);
  }

  void addAktivitas(String name) {
    var aktivitas = Homepage(
        id: name,
        status: false,
        target: judulcontroller.text,
        realita: realitacontroller.text,
        kategori: kategoricontroller.toString(),
        subaktivitas: subaktivitascontroller.toString(),
        waktu: waktucontroller.toString(),
        tanggal: formatDate(initialDate.value).toString());
    homepageC.listAktivitas.add(aktivitas);
    homepageC.listData.value =
        homepageC.getDataByDate(formatDate(homepageC.selectedDay.value));
  }

  bool checkValueIsValid() {
    return judulcontroller.text.isNotEmpty &&
        realitacontroller.text.isNotEmpty &&
        kategoricontroller.toString().isNotEmpty &&
        subaktivitascontroller.toString().isNotEmpty &&
        waktucontroller.toString().isNotEmpty &&
        formatDate(initialDate.value).toString().isNotEmpty;
  }

  void stateSubAktivitas(DetailAktivitasModel data) {
    dataCheck = data.status.obs;
    dataCheck.toggle();
    data.status = dataCheck.value;
    if (dataCheck.isTrue) {
      subaktivitascontroller = data.tittle.toString();
    } else {
      subaktivitascontroller = "";
    }
    print(data.tittle + " = " + data.status.toString());
    change(dataCheck.value, status: RxStatus.success());
  }

  var homeP = Get.put(HomeProvider());
  void addAktivitases() {
    try {
      homeP
          .saveAktivitas(
            formatDate(initialDate.value).toString(),
            judulcontroller.text,
            kategoricontroller.toString(),
            realitacontroller.text,
            waktucontroller.toString(),
          )
          .then((value) => addAktivitas(value.name));
    } catch (err) {
      throw err.toString();
    }
  }
}
