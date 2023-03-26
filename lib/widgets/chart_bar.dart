import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('€${spendingAmount.toStringAsFixed(2)}'))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(220, 220, 220, 1)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary)),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          // ignore: sized_box_for_whitespace
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
