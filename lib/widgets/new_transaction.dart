import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function handleAddTransaction;

  NewTransaction(this.handleAddTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _showIOSDatePicker = false;

  void _handleSubmit() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.handleAddTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _handleSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _handleSubmit(),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (Platform.isIOS) {
                        setState(() {
                          _showIOSDatePicker = true;
                        });
                      } else {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        ).then((selectedDate) {
                          if (selectedDate == null) {
                            return;
                          }
                          setState(() {
                            _selectedDate = selectedDate;
                          });
                        });
                      }
                    },
                    child: Text(
                      'Select date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (Platform.isIOS && _showIOSDatePicker)
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: CupertinoDatePicker(
                          initialDateTime: _selectedDate,
                          maximumDate: DateTime.now(),
                          maximumYear: DateTime.now().year,
                          minimumDate: DateTime(2020),
                          minimumYear: DateTime.now().year,
                          onDateTimeChanged: (selectedDate) {
                            setState(() {
                              _selectedDate = selectedDate;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _handleSubmit,
            )
          ],
        ),
      ),
    );
  }
}
