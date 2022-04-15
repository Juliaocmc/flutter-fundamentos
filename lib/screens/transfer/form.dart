import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transfer.dart';



class TransferForm extends StatelessWidget {
  final TextEditingController _controllerValue = TextEditingController();
  final TextEditingController _controllerAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criar uma transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controllerAccount,
                label: 'Número da conta',
                hint: '00000',
                icon: null,
              ),
              Editor(
                  controller: _controllerValue,
                  label: 'Valor da transferência',
                  hint: '00.00',
                  icon: Icons.monetization_on),
              ElevatedButton(
                onPressed: () => _generateTransfer(context),
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ));
  }

  void _generateTransfer(BuildContext context) {
    final double? value = double.tryParse(_controllerValue.text);
    final int? account = int.tryParse(_controllerAccount.text);
    if (value != null && account != null) {
      final newTransfer = Transfer(value, account);
      Navigator.pop(context, newTransfer);
    }
  }
}
