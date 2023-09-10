
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/core/api_constants.dart';
import 'package:untitled/data/models/income.dart';
import 'package:untitled/data/models/payment_model.dart';

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
  addPayment(PaymentModel payment)async{
    emit(IncomeInitial());
    try{
      var paymentBox=Hive.box<PaymentModel>(DatabaseConstance.kBoxName);
      await paymentBox.add(payment);
      emit(AddPaymentsSuccess());
    }
    catch(ex){
      emit(AddPaymentsFailure());
    }
  }
  IncomeModel ? income;
  fetchName() {
    var incomeBox=Hive.box<IncomeModel>(DatabaseConstance.kBoxName);
    income =incomeBox.values.last;
    emit(GetIncomeSuccess());
  }
}
