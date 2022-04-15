import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/transfer.dart';
import 'form.dart';

const String TITLE = 'Transferências';

class Transfers extends StatefulWidget {
  final List<Transfer> _transfers = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return TransferState();
  }
}

class TransferState extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransfersItems(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then((transfer) => _update(transfer));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _update(Transfer transfer) {
    if (transfer != null) {
      setState(() {
        widget._transfers.add(transfer);
      });
    }
  }
}

class TransfersItems extends StatelessWidget {
  final Transfer _transfer;

  TransfersItems(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.account.toString()),
    ));
  }
}
