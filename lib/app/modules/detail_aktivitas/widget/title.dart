import 'package:flutter/material.dart';

import '../../values/colors.dart';

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      width: deviceWidth,
      child: Text(
        tittle,
        style: TextStyle(color: MyColors.grey, fontSize: 14),
      ),
    );
  }
}
