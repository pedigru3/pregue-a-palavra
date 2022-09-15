import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/order_model.dart';
import 'package:pregue_a_palavra/src/pages/cart/components/ordem_status_widget.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/payment_dialog.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilServices utlServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido ${order.id}'),
              Text(
                utlServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Lista de Produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: _OrdemItemWidget(
                          order: order, utlServices: utlServices),
                    ),
                  ),

                  //Divisão
                  VerticalDivider(
                    width: 8,
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),

                  //Status de pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                      status: order.status,
                    ),
                  )
                ],
              ),
            ),

            //Total
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utlServices.priceToCurrency(order.total),
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),

            //Botão Pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order,);
                    },
                  );
                },
                icon: Image.asset(
                  'images/pix.png',
                  height: 18,
                ),
                label: const Text('Ver QR Code Pix'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrdemItemWidget extends StatelessWidget {
  const _OrdemItemWidget({
    Key? key,
    required this.order,
    required this.utlServices,
  }) : super(key: key);

  final OrderModel order;
  final UtilServices utlServices;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: order.items.map((ordem) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Wrap(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${ordem.quantity} un. ',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: "${ordem.item.title} ",
                    ),
                    TextSpan(
                      text: utlServices.priceToCurrency(ordem.item.promoPrice),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
