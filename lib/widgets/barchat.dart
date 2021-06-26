import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> weaklyExpenses;
  BarChart({this.weaklyExpenses});
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    weaklyExpenses.forEach((price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            'Weakly Spending',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
              Text(
                'Jan 10 2021 - Jan 16 2021 ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Su',
                amountSpent: weaklyExpenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mo',
                amountSpent: weaklyExpenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tu',
                amountSpent: weaklyExpenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'We',
                amountSpent: weaklyExpenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Th',
                amountSpent: weaklyExpenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fr',
                amountSpent: weaklyExpenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sa',
                amountSpent: weaklyExpenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  Bar({
    this.label,
    this.amountSpent,
    this.mostExpensive,
  });
  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.all(5),
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          '$label',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
