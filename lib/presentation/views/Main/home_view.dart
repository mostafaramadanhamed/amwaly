import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/presentation/views/Main/add_info_view.dart';
import 'package:untitled/presentation/views/Main/widgets/home_item.dart';
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

