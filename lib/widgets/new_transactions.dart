// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx);
  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              keyboardType: TextInputType.name,
              // onChanged: (val) {
              // titleInput = val;
              // },u
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(128, 0, 128, 100))),
                onPressed: () {
                  submitData();
                  // print(titleInput);
                  // // ignore: avoid_print
                  // print(amountInput);
                },
                child: const Text("ADD TRANSACTION")),
          ],
        ),
      ),
    );
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }
}
