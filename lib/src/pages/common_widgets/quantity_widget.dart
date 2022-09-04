import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final Function(int quantity) result;

  const QuantityWidget({
    Key? key,
    required this.value,
    required this.result,
  }) : super(key: key);

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
          _QuantityButton(
            icon: Icons.remove,
            color: Colors.grey.shade300,
            onPressed: () {
              if (value == 1) return;

              int quantityResult = value - 1;
              result(quantityResult);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: CustomColors.primaryColor,
            onPressed: () {
              int quantityResult = value + 1;
              result(quantityResult);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
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
