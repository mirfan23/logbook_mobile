import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../provider/detail_aktivitas_provider.dart';
import '../views/sub_aktivitas_widget.dart';

class ListSubAktivitasScreen extends StatefulWidget {
  const ListSubAktivitasScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ListSubAktivitasScreen> createState() => _ListSubAktivitasState();
}

class _ListSubAktivitasState extends State<ListSubAktivitasScreen> {
  final myList = List.generate(
    DetailAktivitasController().myListSubAktivitas.length,
    (index) => AktivitasProvider(
        tittle: DetailAktivitasController().myListSubAktivitas[index],
        id: index.toString()),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => DetailAktivitasController().myListSubAktivitas.isEmpty
            ? Container(
                child: Text("Tidak ada Aktivitas"),
              )
            : ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...myList.map(buildSingleCheckbox).toList(),
                ],
              ),
      ),
    );
  }

  Widget buildSingleCheckbox(AktivitasProvider notification) {
    return buildCheckbox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.status;
          notification.status = newValue;
        });
      },
    );
  }

  Widget buildCheckbox({
    required AktivitasProvider notification,
    required VoidCallback onClicked,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.white2),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.white2),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: MyColors.white2,
                    borderRadius: BorderRadius.circular(2)),
                child:
                    // Obx(() =>
                    Checkbox(
                  side: BorderSide(style: BorderStyle.none),
                  onChanged: (value) {
                    onClicked();
                  },
                  value: notification.status,
                ),
              ),
              // ),
              SizedBox(
                width: 10,
              ),
              Text(notification.tittle),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 0.8,
            color: MyColors.blue,
          ),
        ],
      ),
    );
  }
}

class ListDataSubAktivitas extends StatelessWidget {
  const ListDataSubAktivitas({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailAktivitasController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(() {
        return controller.listSubAktivitas.isEmpty
            ? Container(
                child: Text("Tidak ada Sub-Aktivitas"),
              )
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listSubAktivitas.length,
                itemBuilder: (context, index) {
                  final listData = controller.listSubAktivitas[index];
                  return SubAktivitasWidget(
                    data: listData,
                    controller: controller,
                    index: index,
                  );
                },
              );
      }),
    );
  }
}
