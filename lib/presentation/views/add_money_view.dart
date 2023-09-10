import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/presentation/views/Main/widgets/money_text_field.dart';

class AddMoneyView extends StatelessWidget {
   AddMoneyView({Key? key}) : super(key: key);
final TextEditingController incomeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: customAppBarr(true, context, title: "add money"),
      body: Column(
        children: [
          18.ph,
          Text('add your money'.tr(),style: AppStyles.textStyle18,),
          32.ph,
          MoneyTextField(incomeController: incomeController),
          168.ph,
          ButtonWidget(onTap: (){},),
        ],
      ),
    );
  }
}
