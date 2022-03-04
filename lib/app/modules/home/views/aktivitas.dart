import 'package:flutter/material.dart';

import '../../values/colors.dart';

class AktivitasBody extends StatelessWidget {
  const AktivitasBody({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: deviceWidth,
      child: Row(
        children: [
          Text("Aktivitas",
              style: TextStyle(color: MyColors.darkGrey, fontSize: 18)),
          SizedBox(
            width: 8.0,
          ),
          Text("0",
              style: TextStyle(
                  color: MyColors.amber,
                  fontWeight: FontWeight.w500,
                  fontSize: 18)),
        ],
      ),
    );
  }
}
