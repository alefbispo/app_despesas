import 'package:flutter/material.dart';

class GraficoBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const GraficoBar({
    Key? key,
    required this.label,
    required this.percentage,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Column(
          children: [
            SizedBox(
                height: height * 0.20,
                child: FittedBox(
                    child: FittedBox(
                        child: Text('R\$\n${value.toStringAsFixed(2)}')))),
            SizedBox(height: height * 0.05),
            SizedBox(
              height: height * 0.55,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            SizedBox(
                height: height * 0.15,
                child: FittedBox(
                  child: Text(label),
                )),
          ],
        );
      },
    );
  }
}
