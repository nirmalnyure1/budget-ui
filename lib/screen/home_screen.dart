import 'package:bugetapp_ui_design/data/data.dart';
import 'package:bugetapp_ui_design/helper/get_color.dart';
import 'package:bugetapp_ui_design/models/category.dart';
import 'package:bugetapp_ui_design/models/expenses.dart';
import 'package:bugetapp_ui_design/screen/category_screen.dart';
import 'package:bugetapp_ui_design/widgets/barchat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            pinned: false,
            //
            floating: true,
            expandedHeight: 200.0,
            leading: IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 24.0,
                ),
                onPressed: () {}),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'BUDGET APP',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.all(15.0),
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
                  child: BarChart(weaklyExpenses: weeklySpending),
                );
              } else {
                final Category newCategory = category[index - 1];
                double totalAmountspent = 0;

                newCategory.expenses.forEach((Expenses expenses) {
                  totalAmountspent += expenses.cost;
                });

                return _buildCategory(
                    newCategory: newCategory,
                    totalAmountspent: totalAmountspent);
                // totalAmountSpent+=expenses
              }
            }, childCount: 1 + category.length),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory({Category newCategory, double totalAmountspent}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return CategoryScreen(category: newCategory);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0, 1),
              blurRadius: 6.0,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    newCategory.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${(newCategory.maxAmount - totalAmountspent).toStringAsFixed(2)}/\$${newCategory.maxAmount}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double maxBarWidth = constraints.maxWidth;
                  final double precent =
                      (newCategory.maxAmount - totalAmountspent) /
                          newCategory.maxAmount;

                  double barWidth = precent * maxBarWidth;
                  if (barWidth < 0) {
                    barWidth = 0;
                  }
                  return Stack(
                    children: [
                      Container(
                        //width: double.infinity,
                        height: 18.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade300,
                        ),
                        // child:
                      ),
                      Container(
                        height: 18.0,
                        width: barWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: getColor(context, precent),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
