// ignore_for_file: deprecated_member_use

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

  @override
  void onInit() {
    super.onInit();
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
    data.status = dataCheck.value;
    print(data.tittle + " = " + data.status.toString());
    change(dataCheck.value, status: RxStatus.success());
  }

  void changeTargetToggle() {
    onTarget.toggle();
    print("onTarget : " + onTarget.toString());
  }

  void changeConceptState() {
    onConcept.toggle();
    // onKategoriSelected = "Concept" as RxString;
    print("onConcept : " + onConcept.toString());
  }

  void changeDesignState() {
    onDesign.toggle();
    // onKategoriSelected = "Design" as RxString;
    print("onDesign : " + onDesign.toString());
  }

  void changeDiscussState() {
    onDiscuss.toggle();
    // onKategoriSelected = "Discuss" as RxString;
    print("onDiscuss : " + onDiscuss.toString());
  }

  void changeLearntState() {
    onLearn.toggle();
    // onKategoriSelected = "Learn" as RxString;
    print("onLearn : " + onLearn.toString());
  }

  void changeReportState() {
    onReport.toggle();
    // onKategoriSelected = "Report" as RxString;
    print("onReport : " + onReport.toString());
  }

  void changeOtherState() {
    onOther.toggle();
    // onKategoriSelected = "Other" as RxString;
    print("onOther : " + onOther.toString());
  }
}
