import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';

import '../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.controller, required this.hint, this.keyboardType}) : super(key: key);
 final TextEditingController? controller;
 final String hint;
 final TextInputType ? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType:keyboardType?? TextInputType.text,
        // textDirection: TextDirection.ltr,
        textInputAction: TextInputAction.done,
        cursorColor: AppColors.kLightColor,

        style: AppStyles.textStyle17,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.kWhiteColor,
          hintText: hint.tr(),
          hintStyle: AppStyles.textStyle15,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
