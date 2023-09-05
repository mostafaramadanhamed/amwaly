import 'package:hive/hive.dart';

part 'income.g.dart';
@HiveType(typeId: 0)
class IncomeModel  extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  double income;
  IncomeModel({required this.title,required this.income});


}