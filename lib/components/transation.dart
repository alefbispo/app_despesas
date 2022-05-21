import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transations;
  const TransationList({Key? key, required this.transations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transations
            .map(
              (tr) => Card(
                elevation: 5,
                child: Row(children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tr.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        DateFormat('dd/MM/yyy').format(tr.date),
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            )
            .toList());
  }
}
