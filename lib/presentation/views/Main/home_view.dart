import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/presentation/views/Main/add_info_view.dart';
import 'package:untitled/presentation/views/add_money_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            63.ph,
            HomeItem(title: 'add info', screen: AddInfoView(),),
            28.ph,
            HomeItem(title: 'add money', screen: AddMoneyView(),),
            28.ph,
            HomeItem(title: 'add payment', screen: AddInfoView(),),
          ],
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key, required this.title, required this.screen,
  });
final String title;
final Widget screen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.tr(),style: AppStyles.textStyle20.copyWith(color: AppColors.kSecondaryColor),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: AppColors.kLightColor),
      ),
      onTap: (){
        Utils.push(context, screen);
      },
    );
  }
}
