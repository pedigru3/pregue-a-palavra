import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/constants/books_bible.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/chapters_view.dart';
import 'package:provider/provider.dart';

class BookSearch extends SearchDelegate {
  List<Book> books = BooksBible.books;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (query == '') {
            close(context, null);
          }
          query = '';
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> suggestions = books.where((searchResult) {
      final result = searchResult.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    final controller = Provider.of<BibleController>(context);

    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (_, index) {
            final suggestion = suggestions[index];
            final abbrev = suggestion.abbrev.pt;

            return ListTile(
              title: Text(suggestion.name),
              onTap: () async {
                query = suggestion.name;
                controller.setBook = abbrev;
                close(context, null);
                int? newChapter =
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ChaptersView(
                              book: suggestion,
                            )));
                controller.setChapter = newChapter ?? 1;
                controller.search();
              },
            );
          }),
    );
  }
}
