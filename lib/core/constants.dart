import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/presentation/views/Main/profile_view.dart';

import '../presentation/views/Main/home_view.dart';

abstract class Constants{
static  const kPages=[

    ProfileView(),
 HomeView(),
  ];
static const List<String>titles=[
  'health',
  'food',
  'house',
  'education',
  'clothes',
  'other',
];
static const List<IconData>icons=[
  FontAwesomeIcons.capsules,
  Icons.fastfood_outlined,
  Icons.cottage_outlined,
  Icons.import_contacts_outlined,
  FontAwesomeIcons.shirt,
  FontAwesomeIcons.ellipsisVertical,
];

}