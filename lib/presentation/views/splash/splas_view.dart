import 'package:flutter/material.dart';
import 'package:untitled/core/utils/colors.dart';
import 'package:untitled/presentation/views/splash/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SplashViewBody(),
    );
  }
}
