
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';

AppBar customAppBarr(bool back,context,{
  required String title,
  
})=>AppBar(
  title: Text(title.tr(),style: AppStyles.textStyle17,),
  centerTitle: true,
  elevation: 0,
  backgroundColor: AppColors.kWhiteColor,
  leading:back?IconButton(onPressed: (){
    Utils.pop(context);
  }, icon: const Icon(Icons.arrow_back,color: AppColors.kPrimaryColor,)):null,
);