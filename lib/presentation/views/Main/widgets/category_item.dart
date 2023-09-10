import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 174,
        width: 154,
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color:Colors.black.withOpacity(0.25),blurRadius: 4 ,offset: const Offset(0, 4))
            ]

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 50,color: AppColors.kTextColor,),
            17.ph,
            Text(title.tr(),style: AppStyles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),)
          ],
        ),
      ),
    );
  }
}
