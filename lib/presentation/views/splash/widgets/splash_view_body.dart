

import 'package:flutter/material.dart';

import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/presentation/views/add_name_view.dart';
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

  navigateToHome() {
    return Future.delayed(const Duration(seconds: 3),(){
      Utils.push(context,  AddNameView());
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
            120.ph,
            const Logo(),
            32.ph,
            const AnimatedLogoText(),
          ],
        ),
      )
    ;
  }
}


