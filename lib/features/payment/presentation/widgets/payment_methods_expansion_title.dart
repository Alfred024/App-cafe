import 'package:app_cafe/config/config.dart';
import 'package:flutter/material.dart';

class PaymentMethodsExpansionTitle extends StatefulWidget {
  final String title;
  //final RadioListTile[] radioListTileArray;
  const PaymentMethodsExpansionTitle({super.key, required this.title});

  @override
  State<PaymentMethodsExpansionTitle> createState() =>
      _PaymentMethodsExpansionTitleState();
}

enum PaymentMethods { cash, card }

class _PaymentMethodsExpansionTitleState
    extends State<PaymentMethodsExpansionTitle> {
  PaymentMethods selectedTransport = PaymentMethods.cash;

  @override
  Widget build(BuildContext context) {
    final colorScheeme = AppTheme().getTheme().colorScheme;

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: colorScheeme.surface),
      child: ExpansionTile(
        title: Text(widget.title),
        children: [
          RadioListTile(
              title: const Text('Pagar en efectivo.'),
              value: PaymentMethods.cash,
              groupValue: selectedTransport,
              onChanged: ((value) => setState(() {
                    selectedTransport = PaymentMethods.cash;
                  }))),
          RadioListTile(
              title: const Text('Pagar con tarjeta (crédito o d+ebito)'),
              value: PaymentMethods.card,
              groupValue: selectedTransport,
              onChanged: null),
        ],
      ),
    );
  }
}
