import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).primaryColor,
                //                 width: 2)),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount!.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title!,
                //             style: Theme.of(context).textTheme.titleSmall,
                //           ),
                //           Text(
                //             DateFormat().format(transactions[index].date!),
                //             style: TextStyle(color: Colors.grey[600]),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date!),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      color: Theme.of(context).errorColor,
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
