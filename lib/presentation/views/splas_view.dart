import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';

import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Utils.push(context, const HomeView());
          }, child: const Text('Let\'s Go')),
        ],
      ),
    );
  }
}
