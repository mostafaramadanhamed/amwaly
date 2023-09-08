import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled/core/api_constants.dart';
import 'package:untitled/presentation/views/add_name_view.dart';
import 'package:untitled/presentation/views/splash/splas_view.dart';

import 'cubit/bloc_observer.dart';
import 'data/models/income.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(IncomeModelAdapter());
  await Hive.openBox<IncomeModel>(DatabaseConstance.kBoxName);

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      saveLocale: true,
      startLocale: const Locale('ar', 'EG'),
      path: 'assets/languages',
      // <-- change the path of the translation files
      child: const MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.cairoTextTheme()
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home:  AddNameView(),
    );
  }
}
