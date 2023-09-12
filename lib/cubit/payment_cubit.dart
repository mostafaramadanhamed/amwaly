
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:untitled/cubit/payment_state.dart';

import '../core/api_constants.dart';
import '../data/models/payment_model.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  addPayment(PaymentModel payment)async{
    try{
      var paymentBox=Hive.box<PaymentModel>(DatabaseConstance.kBoxPayment);
      await paymentBox.add(payment);
      emit(AddPaymentsSuccess());
    }
    catch(ex){
      emit(AddPaymentsFailure());
    }
  }
  List<PaymentModel?>payment=[];
  fetchPayment(String title) {
    try {
      var paymentBox=Hive.box<PaymentModel>(DatabaseConstance.kBoxPayment);
      payment =paymentBox.values.where((element) => element.category==title).toList();
      emit(GetPaymentsSuccess());
    } catch (e) {
      emit(GetPaymentsFailure());
    }
  }
}
