import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/data/models/income.dart';

import '../../../core/widgets/text_field.dart';


class AddInfoView extends StatelessWidget {
  AddInfoView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController  incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr(true, context, title: "add info"),
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                29.ph,
                Text("name".tr(), style: AppStyles.textStyle18,),
                17.ph,
                CustomTextField(controller: nameController,
                  hint: "name",
                  keyboardType: TextInputType.name,),
                21.ph,
                Text("balance".tr(), style: AppStyles.textStyle18,),
                17.ph,
                MoneyTextField(incomeController: incomeController),
                55.ph,
                ButtonWidget(
                  onTap: () {
                    try {
                      var incomeModel=IncomeModel(title: nameController.text, income:double.parse(incomeController.text));
                      BlocProvider.of<IncomeCubit>(context).addInfo(incomeModel);
                      Fluttertoast.showToast(
                          msg: "added successfully".tr(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor:AppColors.kTextColor,
                          textColor: Colors.white,
                          fontSize: 18.0
                      );
                    nameController.clear();
                    incomeController.clear();
                    Utils.pop(context);
                    } catch (e) {
                      debugPrint(e.toString());
                      Fluttertoast.showToast(
                          msg: "FormatException: Invalid double".tr(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 18.0
                      );
                    }

                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

class MoneyTextField extends StatelessWidget {
  const MoneyTextField({
    super.key,
    required this.incomeController,
  });

  final TextEditingController incomeController;

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
              hintText: 'money'.tr(),
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
