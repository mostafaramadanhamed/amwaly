import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/core/constants.dart';
import 'package:untitled/presentation/views/Main/widgets/bottom_nav_bar_item.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,

        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex:_currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            bottomNavigationBarItem(icon: FontAwesomeIcons.circleUser, toolTip: 'profile', context: context),
            bottomNavigationBarItem(icon: FontAwesomeIcons.house, toolTip: 'home', context: context),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
        ),
      ),

      body: Constants.kPages[_currentIndex] ,
    );
  }
}
