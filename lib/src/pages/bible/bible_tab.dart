import 'package:flutter/material.dart';

class BibleTab extends StatefulWidget {
  const BibleTab({Key? key}) : super(key: key);

  @override
  State<BibleTab> createState() => _BibleTabState();
}

class _BibleTabState extends State<BibleTab> {
  String test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SafeArea(
          child: Center(
            child: Text('Bíblia Sagrada'),
          ),
        ),
        Text(test),
      ],
    ));
  }
}
