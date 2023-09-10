
import 'package:hive/hive.dart';

part 'payment_model.g.dart';
@HiveType(typeId: 1)
class PaymentModel  extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  double money;
  @HiveField(2)
  String category;

  PaymentModel({required this.title,required this.money,required this.category,});


}