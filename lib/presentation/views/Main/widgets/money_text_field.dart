import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class MoneyTextField extends StatelessWidget {
  const MoneyTextField({
    super.key,
    required this.incomeController, this.hint,
  });

  final TextEditingController incomeController;
final String ? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //  padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.kPrimaryColor,
            width: 1,
          )
      ),
      child: Row(
        children: [
          20.pw,
          Expanded(
              child:TextField(
                keyboardType: TextInputType.number,
                style: AppStyles.textStyle17,
                controller: incomeController,decoration: InputDecoration(
                hintText: hint??'money'.tr(),
                hintStyle: AppStyles.textStyle15,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,

              ),)
          ),
          5.pw,
          const VerticalDivider(
            color: AppColors.kHintColor,
            endIndent: 8,
            indent: 8,

            thickness: 2,
          ),
          18.pw,
          Text("pound".tr(),style: AppStyles.textStyle15.copyWith(color: AppColors.kSecondaryColor),),
          20.pw,
        ],
      ),
    );
  }
}
