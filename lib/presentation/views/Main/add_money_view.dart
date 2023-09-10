import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/presentation/views/Main/widgets/money_text_field.dart';

import '../../../core/utils/colors.dart';
import '../../../cubit/income_cubit.dart';
import '../../../data/models/income.dart';

class AddMoneyView extends StatefulWidget {
  const AddMoneyView({Key? key}) : super(key: key);

  @override
  State<AddMoneyView> createState() => _AddMoneyViewState();
}

class _AddMoneyViewState extends State<AddMoneyView> {
  final TextEditingController incomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<IncomeCubit>(context).fetchName();
  }

  @override
  void dispose() {
    super.dispose();
    incomeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr(true, context, title: "add money"),
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          IncomeModel income = BlocProvider.of<IncomeCubit>(context).income!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                18.ph,
                Text('add your money'.tr(), style: AppStyles.textStyle18,),
                32.ph,
                MoneyTextField(incomeController: incomeController,hint: income.income.toString(),),
                168.ph,
                ButtonWidget(onTap: () {
                  try{
                    double totalIncome=double.parse(incomeController.text)+income.income;
          var incomeModel=IncomeModel(title: income.title, income:totalIncome);
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
          incomeController.clear();
          Utils.pop(context);
          }
          catch (e) {
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

                },),
              ],
            ),
          );
        },
      ),
    );
  }
}
