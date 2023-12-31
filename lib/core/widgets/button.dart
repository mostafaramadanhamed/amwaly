
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';

import '../utils/colors.dart';


class ButtonWidget extends StatelessWidget {

  const ButtonWidget(
      {Key? key,
        this.title = "add",
        this.width = 88.0,
        this.height = 50.0,
        this.onTap,
        this.fontWeight,
        this.child,
        this.fontSize,
        this.textColor =AppColors.kWhiteColor,
        this.buttonColor = AppColors.kTextColor,
        this.borderColor = AppColors.kTextColor,
        this.inkColor = AppColors.kTextColor,
        this.withBorder = false,
        this.radius = 16.0})
      : super(key: key);

  final String title;

  final double width, height, radius;
  final double? fontSize;
  final FontWeight?fontWeight;
  final Widget? child;
  final  Color textColor, buttonColor, borderColor, inkColor;
  final void Function()? onTap;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: withBorder
                      ? BorderSide(color: borderColor)
                      : const BorderSide(color: Colors.transparent)))),
      onPressed: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: inkColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: child ??
            Container(
              constraints: BoxConstraints(minWidth: width, minHeight: height),
              // min sizes for Material buttons
              alignment: Alignment.center,
              child: Text(title.tr(),style: AppStyles.textStyle20.copyWith(
                color: textColor,
              ),
              ),
            ),
      ),
    );
  }
}