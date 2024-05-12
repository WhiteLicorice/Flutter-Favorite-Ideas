import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    List<WordPair> favorites = appState.favorites;

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.', style: theme.textTheme.displayLarge),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              'You have '
              '${favorites.length} favorites:',
              style: theme.textTheme.displayLarge),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asSnakeCase, style: theme.textTheme.displayMedium),
          ),
      ],
    );
  }
}
