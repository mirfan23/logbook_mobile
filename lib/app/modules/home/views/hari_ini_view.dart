// // ignore_for_file: non_constant_identifier_names, camel_case_types

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:logbook_mobile_app/app/routes/app_pages.dart';
// import 'package:logbook_mobile_app/app/utils/helper.dart';

// import '../../values/colors.dart';
// import 'list_body_view.dart';

// class HariIniView extends GetView {
//   @override
//   Widget build(BuildContext context) {
//     final deviceHeight = Get.height;
//     final deviceWidth = Get.width;
//     final bodyHeight = deviceHeight - MyHelper.Myappbar.preferredSize.height;

//     return Scaffold(
//         body: Container(
//           height: bodyHeight,
//           padding: EdgeInsets.all(15),
//           child: SingleChildScrollView(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   tanggal(deviceWidth: deviceWidth),
//                   Aktivitas(deviceWidth: Get.width),
//                   ListAktivitas(deviceWidth: Get.width)
//                 ]),
//           ),
//         ),
//         bottomNavigationBar: Padding(
//           padding: EdgeInsets.all(20),
//           child: MaterialButton(
//               height: bodyHeight * 0.1,
//               color: MyColors.blue,
//               onPressed: () {
//                 Get.toNamed(AppPages.INITIAL_D);
//               },
//               child: Text("+ Tambah Aktivitas",
//                   style: TextStyle(color: MyColors.white, fontSize: 20))),
//         ));
//   }
// }

// class tanggal extends StatelessWidget {
//   const tanggal({
//     Key? key,
//     required this.deviceWidth,
//   }) : super(key: key);

//   final double deviceWidth;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // height: BodyHeight,
//         width: deviceWidth,
//         child: (Text("Senin, 4 Februari 2022",
//             style: TextStyle(
//               color: MyColors.grey,
//               fontSize: 17,
//             ))));
//   }
// }
