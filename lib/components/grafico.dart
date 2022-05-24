import 'package:app_despesas/components/grafico_bar.dart';
import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Grafico({required this.recentTransaction, Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDat = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (int i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDat.day;
        bool sameMonth = recentTransaction[i].date.month == weekDat.month;
        bool sameYear = recentTransaction[i].date.year == weekDat.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }
      final dayFormated = DateFormat.E().format(weekDat)[0];

      return {'day': dayFormated, 'value': totalSum};
    });
  }

  double get _weekTotoalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map(((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: GraficoBar(
                  label: e['day'] as String,
                  value: e['value'] as double,
                  percentage: (e['value'] as double) / _weekTotoalValue,
                ),
              );
            })).toList(),
          ),
        ));
  }
}
