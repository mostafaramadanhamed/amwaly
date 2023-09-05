part of 'income_cubit.dart';

@immutable
abstract class IncomeState {}

class IncomeInitial extends IncomeState {}
class GetIncomeSuccess extends IncomeState {}
class GetIncomeFailure extends IncomeState {}
