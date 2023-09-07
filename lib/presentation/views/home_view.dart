import 'package:flutter/material.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBarr(false, context, title: "add"),
    );
  }
}
