import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/income_cubit.dart';
import 'package:untitled/data/models/income.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IncomeCubit>(context).fetchName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          IncomeModel income = BlocProvider.of<IncomeCubit>(context).income!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${income.title}'),
              Text('${income.income}'),
            ],
          );
        },
      ),
    );
  }
}
