import 'package:bugetapp_ui_design/models/expenses.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expenses> expenses;

  Category({this.name, this.maxAmount, this.expenses});
}
