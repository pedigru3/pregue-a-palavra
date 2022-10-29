import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/home/components/articles_component.dart';
import 'package:pregue_a_palavra/src/pages/home/components/custom_card_component.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomCardComponent(),
          ArticlesComponent(),
          CustomCardComponent(),
        ],
      ),
    );
  }
}
