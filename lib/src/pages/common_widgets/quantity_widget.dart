import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          _QuantityButton(icon: Icons.remove, color: Colors.grey.shade300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('1'),
          ),
          _QuantityButton(icon: Icons.add, color: CustomColors.primaryColor),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({Key? key, required this.icon, required this.color})
      : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            size: 16,
            color: CustomColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
