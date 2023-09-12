abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class GetPaymentsFailure extends PaymentState {}
class GetPaymentsSuccess extends PaymentState {}
class AddPaymentsSuccess extends PaymentState {}
class AddPaymentsFailure extends PaymentState {}