import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transations;
  final Function(String id) delete;
  const TransactionList(
      {Key? key, required this.transations, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: transations.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Nenuma transação cadastrada!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transations.length,
              itemBuilder: (context, index) {
                final tr = transations[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text('R\$${tr.value}')),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d/MM/y').format(tr.date),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: IconButton(
                      onPressed: () => delete(tr.id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
