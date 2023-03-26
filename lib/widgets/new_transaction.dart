// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function transactionHandler;
  NewTransaction(this.transactionHandler, {super.key}) {
    print('Constructor NewTransaction Widget');
  }

  @override
  // ignore: no_logic_in_create_state
  State<NewTransaction> createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.transactionHandler(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              cursorColor: Colors.purple,
              decoration: const InputDecoration(labelText: 'Titolo'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              cursorColor: Colors.purple,
              decoration: const InputDecoration(labelText: 'Importo'),
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Nessuna Data'
                        : 'Data Scelta: ${DateFormat.yMd().format(_selectedDate ?? DateTime.now())}'),
                  ),
                  AdaptiveFlatButton('Scegli Data', _presentDatePicker)
                ],
              ),
            ),
            ElevatedButton(
                onPressed: _submitData,
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary)),
                child: const Text('Aggiungi transazione')),
          ]),
        ),
      ),
    );
  }
}
