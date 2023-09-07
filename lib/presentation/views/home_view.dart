import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/core/widgets/text_field.dart';

import '../../core/utils/colors.dart';

class HomeView extends StatefulWidget {
   const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBarr(false, context, title: "add"),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ButtonWidget(onTap: (){},),
            20.ph,
            CustomTextField(hint: 'add')
          ],
        ),
      ),
    );
  }
}
