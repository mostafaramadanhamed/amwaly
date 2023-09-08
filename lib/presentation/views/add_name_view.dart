import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/core/widgets/button.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

import '../../core/widgets/text_field.dart';



class AddNameView extends StatelessWidget {
  AddNameView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr(false, context, title: "add name"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            29.ph,
            Text("add Your name".tr(),style: AppStyles.textStyle18,),
            28.ph,
            CustomTextField(controller: nameController,hint:"name",keyboardType: TextInputType.name,),
            150.ph,
            ButtonWidget(
              onTap: (){

              },
            ),

          ],
        ),
      ),
    );
  }
}
