
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/utils.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key, required this.title, required this.screen,
  });
  final String title;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.tr(),style: AppStyles.textStyle20.copyWith(color: AppColors.kSecondaryColor),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: AppColors.kLightColor),
      ),
      onTap: (){
        Utils.push(context, screen);
      },
    );
  }
}
