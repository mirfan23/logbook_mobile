import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/helper.dart';
import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../screen/body_detail.dart';
import '../widget/custom_button.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.blue,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {},
      ),
      body: BodyDetailAktivitas(
        controller: controller,
      ),
    );
  }
}
