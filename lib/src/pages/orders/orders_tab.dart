import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/config/app_data.dart' as AppData;
import 'package:pregue_a_palavra/src/pages/orders/components/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => OrderTile(order: AppData.orders[index]),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: AppData.orders.length,
      ),
    );
  }
}
