import 'package:bytebank/components/editor2.dart';
import 'package:flutter/material.dart';
import '../../models/transfer.dart';

enum transactionType { PIX, TED }
enum keyType { EMAIL, CPF }

transactionType? _transactionType;
keyType? _keyType;


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
              const MyStatefulWidget(),
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

class WhatTypeWidget extends StatefulWidget {
  const WhatTypeWidget({Key? key}) : super(key: key);

  @override
  State<WhatTypeWidget> createState() => WhatType();
}

class WhatType extends State<WhatTypeWidget>{
  String dropdownValue = 'CPF';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            if (newValue != null) {
              dropdownValue = newValue;
            }
          });
        },
        items: <String>['CPF', 'EMAIL']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(

            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
        dropdownValue == 'CPF'? IsPixCpf() : IsPixEmail()
      ],
    );
  }
  
}

class IsPixCpf extends StatelessWidget {
  final TextEditingController _controllerAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Editor2(
        controller: _controllerAccount,
        label: 'CPF',
        hint: '000.000.000-00',
        icon: null,
      ),
      Editor2(
        controller: _controllerAccount,
        label: 'Valor da transferência',
        hint: '00.00',
        icon: null,
      )
    ]);
  }
}

class IsPixEmail extends StatelessWidget {
  final TextEditingController _controllerAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Editor2(
        controller: _controllerAccount,
        label: 'E-MAIL',
        hint: 'seu_email@email.com.br',
        icon: null,
      ),
      Editor2(
        controller: _controllerAccount,
        label: 'Valor da transferência',
        hint: '00.00',
        icon: null,
      )
    ]);
  }
}

class IsTed extends StatefulWidget {
  String? dropdownValue;

  @override
  State<IsTed> createState() => _IsTedState();
}

class _IsTedState extends State<IsTed> {
  final TextEditingController _controllerAccount = TextEditingController();
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(children:
    <Widget>[
    DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          if (newValue != null) {
            dropdownValue = newValue;
          }
        });
      },
      items: <String>['Bradesco', 'Caixa Federal', 'Itau', 'Banco do Brasil']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(

          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
      Editor2(
        controller: _controllerAccount,
        label: 'Agência',
        hint: '0000',
        icon: null,
      ),
      Editor2(
        controller: _controllerAccount,
        label: 'Conta Corrente',
        hint: '123456',
        icon: null,
      ),      Editor2(
        controller: _controllerAccount,
        label: 'Valor',
        hint: '00.00',
        icon: null,
      ),
    ]);
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'PIX';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              if (newValue != null) {
                dropdownValue = newValue;
              }
            });
          },
          items: <String>['PIX', 'TED']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(

              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        dropdownValue == 'PIX'? WhatTypeWidget(): IsTed()
      ],
    );
  }
}
