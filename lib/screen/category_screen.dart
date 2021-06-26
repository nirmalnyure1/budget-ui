import 'package:bugetapp_ui_design/helper/get_color.dart';
import 'package:bugetapp_ui_design/models/category.dart';
import 'package:bugetapp_ui_design/models/expenses.dart';
import 'package:bugetapp_ui_design/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({this.category});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expenses expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name,
          style: TextStyle(letterSpacing: 3.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.add), iconSize: 25.0, onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 220.0,
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0, 1),
                      blurRadius: 6.0,
                      spreadRadius: 5,
                    ),
                  ]),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey.shade200,
                  percent: percent,
                  width: 12.0,
                  lineColor: getColor(context, percent),
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/ \$${widget.category.maxAmount}',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                  ),
                ),
              ),
            ),
            buildExpenseList(),
          ],
        ),
      ),
    );
  }

  buildExpenseList() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expenses expenses) {
      return expenseList.add(Container(
        height: 100.0,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 1),
                blurRadius: 6.0,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              expenses.name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              '\$${expenses.cost.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ));
    });

    return Column(
      children: expenseList,
    );
  }
}
