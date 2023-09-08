import 'package:flutter/material.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/presentation/views/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Utils.push(context, ProfileView());
          }, child: Text('oo'))
        ],
      ),
    );
  }
}
