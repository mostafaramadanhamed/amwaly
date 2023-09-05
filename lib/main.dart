import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'features/splash/presentation/views/splas_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      saveLocale: true,
      startLocale: Locale('ar','EG'),
      path: 'assets/languages', // <-- change the path of the translation files
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
