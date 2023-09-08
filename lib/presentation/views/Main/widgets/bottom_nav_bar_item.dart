



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';


BottomNavigationBarItem bottomNavigationBarItem({
  required IconData icon,
  required String toolTip,
  required BuildContext context,

})=> BottomNavigationBarItem(
  icon: Icon(icon,size: 24,color: AppColors.kHintColor,),
  label: '',
  tooltip: toolTip.tr(),
  activeIcon: Icon(icon,color:AppColors.kTextColor,size: 26,),
);

