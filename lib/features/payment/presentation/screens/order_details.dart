import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/payment/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: Obtener el id del usuario almacenado en el local storage, y usar el endpoint get order info

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text('Tu pedido/órden'),
      ),
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const DeliveryOptionsExpansionTitle(title: 'Forma de entrega'),
              const PaymentMethodsExpansionTitle(title: 'Métodos de pago'),
            ],
          ),
        )),
        const _OrderAmoutnContainer(),
        Container(
          margin: EdgeInsets.only(right: 15),
          alignment: Alignment.topRight,
          width: double.infinity,
          height: 60,
          child: FilledButton(
              onPressed: () {
                // TODO: Finalizar el pedido solicitado
              },
              child: const Text('Finalizar pedido')),
        ),
      ]),
    );
  }
}

class _OrderAmoutnContainer extends StatelessWidget {
  // TODO: Hacer la consulta de la información de la órden usando el id del usuario
  const _OrderAmoutnContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;
    const contentTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
    const amountTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

    final containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: colorScheme.surface);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 180,
      decoration: containerDecoration,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text('Costo productos', style: contentTextStyle),
              Spacer(),
              Text('\$100', style: amountTextStyle)
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Text('Tarifa del servicio', style: contentTextStyle),
              Spacer(),
              Text('\$100', style: amountTextStyle)
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Text('Consto envío', style: contentTextStyle),
              Spacer(),
              Text('No aplica', style: amountTextStyle)
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Text('Total', style: contentTextStyle),
              Spacer(),
              Text('\$100', style: amountTextStyle)
            ],
          ),
        ],
      ),
    );
  }
}
