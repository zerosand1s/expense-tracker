import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayLabel;
  final double totalAmountSpentInADay;
  final double percentageOfTotalAmountSpent;

  ChartBar(
    this.dayLabel,
    this.totalAmountSpentInADay,
    this.percentageOfTotalAmountSpent,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${totalAmountSpentInADay.toStringAsFixed(1)}'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                heightFactor: percentageOfTotalAmountSpent,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(dayLabel),
      ],
    );
  }
}
