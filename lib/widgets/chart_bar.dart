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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.12,
              child: FittedBox(
                child: Text('\$${totalAmountSpentInADay.toStringAsFixed(1)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              width: 10,
              height: constraints.maxHeight * 0.66,
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
                        color: Color(0xFF6263E8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    heightFactor: percentageOfTotalAmountSpent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.12,
              child: FittedBox(
                child: Text(dayLabel),
              ),
            ),
          ],
        );
      },
    );
  }
}
