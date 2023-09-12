import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/text_field.dart';
import 'package:untitled/cubit/payment_cubit.dart';
import 'package:untitled/cubit/payment_state.dart';
import 'package:untitled/data/models/payment_model.dart';
import 'package:untitled/presentation/views/Main/widgets/money_text_field.dart';
import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../cubit/income_cubit.dart';
import '../../../data/models/income.dart';

class AddPaymentsView extends StatefulWidget {
   const AddPaymentsView({Key? key, required this.income,}) : super(key: key);
final IncomeModel  income;
  @override
  State<AddPaymentsView> createState() => _AddPaymentsViewState();
}

class _AddPaymentsViewState extends State<AddPaymentsView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

   String ? value;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBarr(true, context, title: "add payment"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocProvider(
  create: (context) => PaymentCubit(),
  child: BlocBuilder<PaymentCubit, PaymentState>(
  builder: (context, state) {
    //IncomeModel income = BlocProvider.of<IncomeCubit>(context).income!;
    return  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              46.ph,
              CustomTextField(hint: 'payments',controller: titleController,),
              31.ph,
              MoneyTextField(incomeController: moneyController,),
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
                  underline: const SizedBox(),
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
                try{
                 double totalIncome=widget.income.income-double.parse(moneyController.text);
                 var incomeModel=IncomeModel(title: widget.income.title, income:totalIncome);
                 BlocProvider.of<IncomeCubit>(context).addInfo(incomeModel);
                  var paymentModel=PaymentModel(
                      title: titleController.text,
                      money: double.parse(moneyController.text), category: value!);
                  BlocProvider.of<PaymentCubit>(context).addPayment(paymentModel);
                  Fluttertoast.showToast(
                      msg:" ${"added successfully".tr()}\n${"total balance".tr()} $totalIncome",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor:AppColors.kTextColor,
                      textColor: Colors.white,
                      fontSize: 18.0
                  );
                  print(paymentModel.title);
                  print(paymentModel.money);
                  print(paymentModel.category);
                  titleController.clear();
                  moneyController.clear();
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
  },
),
            ],
          
),
    );
  },
),
),
      ),
    );
  }
}
