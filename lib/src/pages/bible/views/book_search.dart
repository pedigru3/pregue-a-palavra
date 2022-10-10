import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/constants/books_bible.dart';

class BookSearch extends SearchDelegate {
  List<String> searchResults = BooksBible.searchResults;

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
    return IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
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
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (_, index) {
            final suggestion = suggestions[index];
            final abbrev = BooksBible.books[index]["abbrev"]["pt"];

            return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                close(context, null);
              },
            );
          }),
    );
  }
}
