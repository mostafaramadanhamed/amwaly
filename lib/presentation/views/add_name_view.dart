import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/data/models/income.dart';

import '../../core/widgets/text_field.dart';


class AddInfoView extends StatelessWidget {
  AddInfoView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController  incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr(false, context, title: "add name"),
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
                Text("money".tr(), style: AppStyles.textStyle18,),
                17.ph,
                CustomTextField(controller: incomeController,
                  hint: "balance",
                  keyboardType: TextInputType.number,),
                55.ph,
                ButtonWidget(
                  onTap: () {
                    try {
                      var incomeModel=IncomeModel(title: nameController.text, income:double.parse(incomeController.text));
                      BlocProvider.of<IncomeCubit>(context).addInfo(incomeModel);
                      print(incomeModel.title);
                      print(incomeModel.income);

                    ///  Utils.pop(context);
                    } catch (e) {
                      print(e);
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
