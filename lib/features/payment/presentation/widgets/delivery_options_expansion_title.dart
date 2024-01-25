import 'package:app_cafe/config/config.dart';
import 'package:flutter/material.dart';

class DeliveryOptionsExpansionTitle extends StatefulWidget {
  final String title;
  //final RadioListTile[] radioListTileArray;
  const DeliveryOptionsExpansionTitle({super.key, required this.title});

  @override
  State<DeliveryOptionsExpansionTitle> createState() =>
      _DeliveryOptionsExpansionTitleState();
}

enum DeliveryOption { pickup, delivery }

class _DeliveryOptionsExpansionTitleState
    extends State<DeliveryOptionsExpansionTitle> {
  DeliveryOption selectedTransport = DeliveryOption.pickup;

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
              title: const Text('Recoger en cafetería.'),
              value: DeliveryOption.pickup,
              groupValue: selectedTransport,
              onChanged: ((value) => setState(() {
                    selectedTransport = DeliveryOption.pickup;
                  }))),
          RadioListTile(
              title: const Text(
                  'Entregar en la ubicación. (Disponible proximamente)'),
              value: DeliveryOption.delivery,
              groupValue: selectedTransport,
              onChanged: null),
        ],
      ),
    );
  }
}
