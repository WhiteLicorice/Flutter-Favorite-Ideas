import 'package:flutter/material.dart';
import 'package:namer_app/big_card.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(mainAxisSize: MainAxisSize.min, children: [
            ElevatedButton(
                onPressed: () {
                  appState.toggleFavorite();
                },
                child: Text("Like")),
            SizedBox(width: 10),
            ElevatedButton.icon(
                onPressed: () {
                  appState.getNext();
                },
                icon: Icon(icon),
                label: Text("Next")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  appState.resetCount();
                },
                child: Text("Reset"))
          ]),
        ],
      ),
    );
  }
}
