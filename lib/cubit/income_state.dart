part of 'income_cubit.dart';

@immutable
abstract class IncomeState {}

class IncomeInitial extends IncomeState {}
class SetIncomeSuccess extends IncomeState {}
class GetIncomeSuccess extends IncomeState {}
class SetIncomeFailure extends IncomeState {}
class GetIncomeFailure extends IncomeState {}
class GetPaymentsFailure extends IncomeState {}
class GetPaymentsSuccess extends IncomeState {}
class AddPaymentsSuccess extends IncomeState {}
class AddPaymentsFailure extends IncomeState {}