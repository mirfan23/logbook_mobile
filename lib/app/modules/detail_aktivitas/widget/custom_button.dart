import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.color,
    required this.text,
    required this.useLeading,
    required this.onPressed,
    this.icon,
    this.textColor,
    this.iconColor,
    this.sizeIcon,
    this.borderRadius,
  }) : super(key: key);
  final String text;
  final Color color;
  final bool useLeading;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;
  final double? sizeIcon;
  final double? borderRadius;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyHelper.Myappbar.preferredSize.height * 0.8,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(borderRadius!)),
      child: MaterialButton(
        onPressed: onPressed,
        child: useLeading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon!,
                    size: sizeIcon!,
                    color: iconColor!,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: textColor!),
                  )
                ],
              )
            : Text(text, style: TextStyle(color: textColor!)),
      ),
    );
  }
}
