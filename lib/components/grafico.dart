import 'package:app_despesas/components/grafico_bar.dart';
import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';

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

      String diaEd = '';
      switch (weekDat.weekday) {
        case 1:
          diaEd = 'Seg';
          break;
        case 2:
          diaEd = 'Ter';
          break;
        case 3:
          diaEd = 'Qua';
          break;
        case 4:
          diaEd = 'Qui';
          break;
        case 5:
          diaEd = 'Sex';
          break;
        case 6:
          diaEd = 'Sab';
          break;
        case 7:
          diaEd = 'Dom';
          break;
      }
      return {'day': diaEd, 'value': totalSum};
    }).reversed.toList();
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
                  percentage: _weekTotoalValue == 0
                      ? 0
                      : (e['value'] as double) / _weekTotoalValue,
                ),
              );
            })).toList(),
          ),
        ));
  }
}
