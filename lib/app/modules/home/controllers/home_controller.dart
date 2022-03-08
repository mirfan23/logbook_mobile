import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home_model.dart';

class HomeController extends GetxController with StateMixin {
  var isCalendarDropdown = true.obs;
  var stateViewDate = false.obs;
  var stateAktivitasValue = false.obs;
  var listAktivitas = List<Homepage>.empty().obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  var selectedDay = DateTime.now().obs;

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);

  // void changeDateView() {
  //   stateViewDate.toggle();
  // }

  RxBool statusCheck = false.obs;

  void stateAktivitas(Homepage data) {
    statusCheck = data.status.obs;
    statusCheck.toggle();
    data.status = statusCheck.value;
    print(data.target.toString() + " = " + data.status.toString());
    change(statusCheck.value, status: RxStatus.success());
  }

  String formatDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy");
    return formatDate.format(date);
  }

  @override
  void onInit() {
    super.onInit();
    var aktivitas = Homepage(
        id: "0",
        status: false,
        target: "Re-Design Web Arkatama",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Design",
        subaktivitas: "Analisis",
        waktu: "Sebelum Dzuhur",
        tanggal: "Saturday, 5 March 2022");
    var aktivitas2 = Homepage(
        id: "0",
        status: false,
        target: "Re-Make Project PWMP",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Concept",
        subaktivitas: "Wireframe",
        waktu: "Sesudah Dzuhur",
        tanggal: "Sabtu, 25 Februari 2022");
    var aktivitas3 = Homepage(
        id: "0",
        status: false,
        target: "Slicing Logbook",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Discuss",
        subaktivitas: "Prototyping",
        waktu: "Setelah Ashar",
        tanggal: "Sabtu, 25 Februari 2022");
    listAktivitas.add(aktivitas);
    listAktivitas.add(aktivitas2);
    listAktivitas.add(aktivitas3);
  }

  List<Homepage> getByDate(String date) {
    return listAktivitas.where((element) => element.tanggal == date).toList();
  }
}
