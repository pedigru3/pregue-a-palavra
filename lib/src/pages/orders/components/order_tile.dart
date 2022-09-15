import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/order_model.dart';
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
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((ordem) {
                        return Row(
                          children: [
                            Text(
                              '${ordem.quantity} un.',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ordem.item.title,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
