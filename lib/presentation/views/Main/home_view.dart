import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utils/utils.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/presentation/views/Main/add_info_view.dart';
import 'package:untitled/presentation/views/Main/add_payments.dart';
import 'package:untitled/presentation/views/Main/widgets/home_item.dart';
import 'package:untitled/presentation/views/Main/add_money_view.dart';

import '../../../data/models/income.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //BlocProvider.of<IncomeCubit>(context).fetchName();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCubit, IncomeState>(
      builder: (context, state) {
        IncomeModel income = BlocProvider.of<IncomeCubit>(context).income??IncomeModel(title: "", income: 0.0);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                63.ph,
                HomeItem(title: 'add info', screen: AddInfoView(),),
                28.ph,
                const HomeItem(title: 'add money', screen: AddMoneyView(),),
                28.ph,
                 HomeItem(
                  title: 'add payment', screen: AddPaymentsView(income: income,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

