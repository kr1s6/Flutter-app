import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favs = appState.favorites;
    final theme = Theme.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    if (favs.isEmpty) {
      return Center(
        child: Text(
          'No favorites yet',
          style: style.copyWith(color: Colors.black),
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var fav in favs)
          ListTile(
            leading: Icon(
              Icons.favorite,
              size: 15,
            ),
            title: Text(
              fav.asPascalCase,
              style: style.copyWith(color: Colors.black, fontSize: 18),
            ),
            trailing: IconButton(
              hoverColor: Colors.green.withOpacity(0.08),
              onPressed: () {
                appState.removeFavorite(fav);
              },
              icon: Icon(
                Icons.delete,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }
}
