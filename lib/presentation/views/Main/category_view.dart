
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/cubit/payment_cubit.dart';
import 'package:untitled/cubit/payment_state.dart';
import 'package:untitled/data/models/payment_model.dart';


class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.title,}) : super(key: key);
final String  title;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PaymentCubit>(context).fetchPayment(widget.title);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        List<PaymentModel?>payment = BlocProvider.of<PaymentCubit>(context).payment;
        return Scaffold(
      appBar: customAppBarr(true, context, title: widget.title),
      body: payment.isNotEmpty? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
            itemCount: payment.length,
            itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PaymentItem(payment: payment,index: index,),
            );
        },),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(alignment: Alignment.center,child: Text('empty list'.tr(),style: AppStyles.textStyle22,)),
        ],
      ),
    );
  },
);
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.payment, required this.index,
  });
final int index;
  final List<PaymentModel?> payment;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(right: 36,top: 12,left: 29,bottom: 8),
    decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
      borderRadius: BorderRadius.circular(32),
      border: Border.all(color: AppColors.kTextColor,width: 0.5),
      boxShadow:[
        BoxShadow(color: Colors.black.withOpacity(0.25),offset: const Offset(0, 4),blurRadius: 4)
      ]
    ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(payment[index]!.title,overflow:TextOverflow.ellipsis,style: AppStyles.textStyle22,maxLines: 2,)),
            const Spacer(),
            IconButton(onPressed: (){
              payment[index]!.delete();
              Fluttertoast.showToast(msg: "deleted successfully".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
              BlocProvider.of<PaymentCubit>(context).fetchPayment(payment[index]!.category);
            }, icon: const Icon(FontAwesomeIcons.trash,color: AppColors.kTextColor,size: 26,)),
          ],
        ),
        5.ph,
        Row(
          children: [
            Row(
              children: [
                Text('price'.tr(),style: AppStyles.textStyle20,),
                2.pw,
                 Text(payment[index]!.money.toString(),style: AppStyles.textStyle20,),
                4.pw,
                Text('pound'.tr(),style: AppStyles.textStyle20,),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: (){
              Fluttertoast.showToast(msg: "coming soon".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.deepPurple,
                  textColor: Colors.white,
                  fontSize: 18.0
              );


            }, icon: const Icon(FontAwesomeIcons.rotateLeft,color: AppColors.kTextColor,size: 26,)),
          ],
        ),

      ],
    ),
          );
  }
}
