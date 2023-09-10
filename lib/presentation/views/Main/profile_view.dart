import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/constants.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/data/models/income.dart';
import 'package:untitled/presentation/views/Main/widgets/category_item.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IncomeCubit>(context).fetchName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {

          IncomeModel income = BlocProvider.of<IncomeCubit>(context).income!;
        //  List<PaymentModel?>payment = BlocProvider.of<IncomeCubit>(context).payment;
          return income.title.isNotEmpty? Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                47.ph,
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.circleUser,size: 38,color: AppColors.kHintColor,),
                        14.pw,
                        Text(
                          "hello".tr(),style: AppStyles.textStyle22,),
                        4.pw,
                        Text(
                          income.title??"",style: AppStyles.textStyle22,),
                      ],
                    ),
                    22.ph,
                    Row(
                      children: [
                        Text('total balance'.tr(),style: AppStyles.textStyle20,),
                        2.pw,
                        Text('${income.income}',style: AppStyles.textStyle20,),
                        4.pw,
                        Text('pound'.tr(),style: AppStyles.textStyle20,),
                      ],
                    ),
                  ],
                ),
                8.pw,
                Text('categories'.tr(),style: AppStyles.textStyle18,),
                25.ph,
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,mainAxisSpacing:30,crossAxisSpacing: 20, ),
                      itemCount: 6,
                      itemBuilder: (context,index){
                    return  CategoryItem(title: Constants.titles[index], icon: Constants.icons[index],);
                  }),
                ),
              ],
            ),
          ):SizedBox();
        },
      ),
    );
  }
}

