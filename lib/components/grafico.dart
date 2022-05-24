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

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: groupedTransactions.map(((e) {
            return Text('${e['day']}: ${e['value']}');
          })).toList(),
        ));
  }
}
