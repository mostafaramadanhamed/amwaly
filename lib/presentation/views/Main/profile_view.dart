import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/constants.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/presentation/views/Main/widgets/category_item.dart';

import '../../../data/models/income.dart';
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
    return const Scaffold(

      body: Padding(
            padding: EdgeInsets.symmetric(horizontal:16.0),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ProfileViewBody()),
          ),
    );
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCubit, IncomeState>(
  builder: (context, state) {
    IncomeModel income = BlocProvider.of<IncomeCubit>(context).income!;
    return  Column(
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
                  income.title,style: AppStyles.textStyle22,),
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
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,mainAxisSpacing:30,crossAxisSpacing: 20, ),
            itemCount: 6,
            itemBuilder: (context,index){
          return  CategoryItem(title: Constants.titles[index], icon: Constants.icons[index],);
        }),
      ],
    );
  },
);
  }
}

