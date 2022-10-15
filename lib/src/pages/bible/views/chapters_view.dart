import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';

class ChaptersView extends StatelessWidget {
  const ChaptersView({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: GridView.builder(
            itemCount: book.chapters,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                onPressed: () {
                  Navigator.pop(context, index + 1);
                },
                child: Text('${index + 1}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
