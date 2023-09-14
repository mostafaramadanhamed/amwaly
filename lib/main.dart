import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled/core/api_constants.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/data/models/payment_model.dart';
import 'package:untitled/presentation/views/splash/splas_view.dart';

import 'cubit/bloc_observer.dart';
import 'data/models/income.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(IncomeModelAdapter());
  Hive.registerAdapter(PaymentModelAdapter());
  await Hive.openBox<IncomeModel>(DatabaseConstance.kBoxName);
  await Hive.openBox<PaymentModel>(DatabaseConstance.kBoxPayment);

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
    return BlocProvider(
      create: (context) => IncomeCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Cairo",
        ),

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,

        home: const SplashView(),
      ),
    );
  }
}
