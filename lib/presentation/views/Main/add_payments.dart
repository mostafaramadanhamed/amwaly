import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/text_field.dart';
import 'package:untitled/presentation/views/Main/widgets/money_text_field.dart';
import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AddPaymentsView extends StatefulWidget {
   const AddPaymentsView({Key? key}) : super(key: key);

  @override
  State<AddPaymentsView> createState() => _AddPaymentsViewState();
}

class _AddPaymentsViewState extends State<AddPaymentsView> {
  final TextEditingController incomeController = TextEditingController();

   String ? value;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBarr(true, context, title: "add payment"),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              46.ph,
              const CustomTextField(hint: 'payments'),
              31.ph,
              MoneyTextField(incomeController: incomeController,),
              31.ph,
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.kPrimaryColor ),
                ),
                child: DropdownButton<String>(
                  hint: Text('category'.tr()),
                 isExpanded: true,
             padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemHeight: 75,
                 underline: SizedBox(),
                 borderRadius: BorderRadius.circular(16),
                 dropdownColor: AppColors.kWhiteColor,
                 value: value,
                 items: Constants.titles.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.tr(),style: AppStyles.textStyle20,),
                    );
                  }).toList(),
                  onChanged: (val) {
                     value=val!;
                     setState(() {

                     });
                  },
                ),
              ),
              133.ph,
              ButtonWidget(onTap: () {

              },),
            ],
          ),
        ),
      ),
    );
  }
}
