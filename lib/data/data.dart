import 'dart:math';

import 'package:bugetapp_ui_design/models/category.dart';
import 'package:bugetapp_ui_design/models/expenses.dart';

final random = Random();

final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};

final List<double> weeklySpending = [
  random.nextDouble() * 100,
  random.nextDouble() * 100,
  random.nextDouble() * 100,
  random.nextDouble() * 100,
  random.nextDouble() * 100,
  random.nextDouble() * 100,
  random.nextDouble() * 100,
];

_generatedExpenses() {
  List<Expenses> expenses = [
    Expenses(name: 'item1', cost: random.nextDouble() * 90),
    Expenses(name: 'item2', cost: random.nextDouble() * 90),
    Expenses(name: 'item3', cost: random.nextDouble() * 90),
    Expenses(name: 'item4', cost: random.nextDouble() * 90),
    Expenses(name: 'item5', cost: random.nextDouble() * 90),
  ];
  return expenses;
}

List<Category> category = [
  Category(name: 'Food', maxAmount: 450, expenses: _generatedExpenses()),
  Category(name: 'Colthing', maxAmount: 500, expenses: _generatedExpenses()),
  Category(name: 'Utilities', maxAmount: 600, expenses: _generatedExpenses()),
  Category(
      name: 'Entertainment', maxAmount: 330, expenses: _generatedExpenses()),
  Category(
      name: 'Transportation', maxAmount: 500, expenses: _generatedExpenses()),
  Category(name: 'Housing', maxAmount: 1000, expenses: _generatedExpenses()),
];
