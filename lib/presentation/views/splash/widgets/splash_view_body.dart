

import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/presentation/views/Main/main_view.dart';
import 'package:untitled/presentation/views/splash/widgets/animated_text_logo.dart';
import 'package:untitled/presentation/views/splash/widgets/logo.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }
  // showAlertDialog(BuildContext context) {
  //
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("add".tr()),
  //     onPressed: () { Utils.push(context, AddInfoView());},
  //   );
  // Widget cancelButton = TextButton(
  //     child: Text("add".tr()),
  //     onPressed: () {Utils.pop(context); },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("add info".tr()),
  //     content: Text("add info".tr()),
  //     actions: [
  //       okButton,
  //       cancelButton
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
  navigateToHome() {
    return Future.delayed(const Duration(seconds: 3),()  {
     Utils.push(context, const MainView());
    });
  }
  @override
  Widget build(BuildContext context) {

    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: MediaQuery.of(context).size.height/4,),
            const Logo(),
            32.ph,
            const AnimatedLogoText(),
          ],
        ),
      )
    ;
  }
}


