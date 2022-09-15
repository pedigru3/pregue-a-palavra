import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, title: 'Pedido confirmado'),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.yellow,
          )
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix vencido',
            backgroundColor: Colors.red,
          )
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            title: 'Pagamento',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: 'Preparando',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: 'Envio',
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus == 5,
            title: 'Entregue',
          ),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      width: 2,
      height: 10,
      color: CustomColors.primaryColor,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Dot
        Container(
            margin: EdgeInsets.only(right: 8),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomColors.primaryColor,
                ),
                color: isActive
                    ? backgroundColor ?? CustomColors.primaryColor
                    : Colors.transparent),
            child: isActive
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  )
                : null),

        //Texto
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontSize: 12),
        ))
      ],
    );
  }
}
