import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/order_model.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({Key? key, required this.order}) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Pagamento por Pix',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                QrImage(
                  data: "http://felipeeniege.com.br",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Vencimento: ${utilServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(fontSize: 12.5),
                ),
                Text(
                  'Total: ${utilServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                OutlinedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    icon: const Icon(Icons.copy),
                    label: const Text('Copiar código Pix'))
              ],
            ),
          ),

          Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ))
        ],
      ),
    );
  }
}
