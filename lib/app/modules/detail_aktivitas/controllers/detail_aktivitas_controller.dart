// ignore_for_file: deprecated_member_use, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/provider/detail_aktivitas_provider.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/home_model.dart';
import '../../home/provider/home_provider.dart';
import '../detail_aktivitas_model.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var homepageC = Get.put(HomeController());
  var homepageProvider = Get.put(HomeProvider());

  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  RxBool statusSelected = false.obs;
  RxInt selectedKategori = 0.obs;

  Rx<DateTime> initialDate = DateTime.now().obs;
  Rx<DateTime> firstDate = DateTime(2000).obs;
  Rx<DateTime> lastDate = DateTime(2030).obs;
  RxString waktuSelected = "Pilih waktu....".obs;
  RxString onTanggalSelected = "".obs;

  RxBool dataCheck = false.obs;

  // ignore: non_constant_identifier_names
  DetailProvider DetailP = Get.put(DetailProvider());

  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
  ];

  final List<String> itemSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
    "Development",
    "Bug Fix",
    "Build",
  ];

  final List<String> listKategori = [
    "Concept",
    "Design",
    "Discuss",
    "Learn",
    "Report",
    "Other",
  ];

  late String id;
  late TextEditingController judulcontroller;
  late TextEditingController realitacontroller;
  late String waktucontroller;
  late String kategoricontroller;
  late String subaktivitascontroller;

  @override
  void onInit() {
    super.onInit();
    // id = Get.arguments().toString();
    judulcontroller = TextEditingController();
    realitacontroller = TextEditingController();
    waktucontroller = "";
    kategoricontroller = "";
    subaktivitascontroller = "";

    for (var i = 0; i < itemSubAktivitas.length; i++) {
      var subAktivitas =
          DetailAktivitasModel(status: false, tittle: itemSubAktivitas[i]);
      listSubAktivitas.add(subAktivitas);
    }
    if (Get.arguments != null) {
      showEditAktivitas(Get.arguments);
    }
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

  void addAktivitasToList(String id) {
    var aktivitas = Homepage(
      id: id,
      status: false,
      target: judulcontroller.text,
      realita: realitacontroller.text,
      kategori: kategoricontroller.toString(),
      subaktivitas: subaktivitascontroller.toString(),
      waktu: waktucontroller.toString(),
      tanggal: formatDate(initialDate.value).toString(),
    );
    homepageC.listAktivitas.add(aktivitas);
    homepageC.listData.value = homepageC.getDataByDate(
      formatDate(homepageC.selectedDay.value),
    );
    change("success", status: RxStatus.success());
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
    dataCheck.value = data.status;
    dataCheck.toggle();
    data.status = dataCheck.value;
    if (data.status) {
      subaktivitascontroller = data.tittle.toString();
    } else {
      subaktivitascontroller = "";
    }
    print(subaktivitascontroller);
    print(data.tittle + " = " + data.status.toString());
  }

  void addAktivitases() {
    try {
      homepageProvider
          .saveAktivitas(
            formatDate(initialDate.value).toString(),
            judulcontroller.text,
            kategoricontroller.toString(),
            realitacontroller.text,
            waktucontroller.toString(),
          )
          .then((value) => addAktivitasToList(value.name));
    } catch (err) {
      throw err.toString();
    }
  }

  void updateLogBook(String id) {
    try {
      DetailP.editLogBook(
              id,
              judulcontroller.text,
              kategoricontroller.toString(),
              realitacontroller.text,
              waktucontroller.toString(),
              formatDate(initialDate.value))
          .then((value) {});
    } catch (e) {
      print(e);
    }
  }

  void showEditAktivitas(String id) {
    try {
      DetailP.showLogBook(id).then(
        (response) {
          var data = response.logs[0];
          judulcontroller.text = data.target;
          realitacontroller.text = data.reality;
          selectedKategori.value = listKategori.indexOf(data.category) + 1;
          waktuSelected.value = data.time;
          waktucontroller = data.time;
          onTanggalSelected.value = response.timestamp;
          change(null, status: RxStatus.success());
        },
        onError: (err) {
          throw err.toString();
        },
      );
    } catch (err) {
      throw err.toString();
    }
  }

  void editAktivitasOnList(String id) {
    var data = homepageC.listAktivitas[
        homepageC.listAktivitas.indexWhere((element) => element.id == id)];
    var dataSecond = homepageC
        .listData[homepageC.listData.indexWhere((element) => element.id == id)];
    saveToListAktivitas(data);
    saveToListData(dataSecond);
    print("etrert" + formatDate(initialDate.value).toString());
  }

  void saveToListAktivitas(Homepage data) {
    data.target = judulcontroller.text;
    data.realita = realitacontroller.text;
    data.kategori = kategoricontroller.toString();
    data.subaktivitas = "subAktivitas";
    data.waktu = waktucontroller.toString();
    data.tanggal = formatDate(initialDate.value).toString();
  }

  void saveToListData(Homepage data) {
    data.target = judulcontroller.text;
    data.realita = realitacontroller.text;
    data.kategori = kategoricontroller.toString();
    data.subaktivitas = "subAktivitas";
    data.waktu = waktucontroller.toString();
    data.tanggal = formatDate(initialDate.value).toString();
  }
}
