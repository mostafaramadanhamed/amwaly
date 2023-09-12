
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/core/api_constants.dart';
import 'package:untitled/data/models/income.dart';

part 'income_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit() : super(IncomeInitial());

  addInfo(IncomeModel income)async{
    emit(IncomeInitial());
    try{
      var incomeBox=Hive.box<IncomeModel>(DatabaseConstance.kBoxName);
      await incomeBox.add(income);
      emit(SetIncomeSuccess());
    }
    catch(ex){
      emit(SetIncomeFailure());
    }
  }
  IncomeModel ? income;
  fetchName() {
    var incomeBox=Hive.box<IncomeModel>(DatabaseConstance.kBoxName);
    income =incomeBox.values.last;
    emit(GetIncomeSuccess());
  }
}
