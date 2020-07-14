import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/greatPlaces.dart';
import 'addPlaceScreen.dart';
import 'placeDetailsScreen.dart';

class PlacesListScreen extends StatelessWidget {
  final centerLoader = const Center(
    child: const CircularProgressIndicator(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? centerLoader
                : Consumer<GreatPlaces>(
                    child: centerLoader,
                    builder: (ctx, greatPlaces, ch) {
                      return greatPlaces.items.length <= 0
                          ? ch
                          : ListView.builder(
                              itemCount: greatPlaces.items.length,
                              itemBuilder: (ctx, i) => ListTile(
                                  leading: Hero(
                                    tag: greatPlaces.items[i].id,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(
                                        greatPlaces.items[i].image,
                                      ),
                                    ),
                                  ),
                                  title: Text(greatPlaces.items[i].title),
                                  subtitle: Text(greatPlaces.items[i].location
                                      .address), //PlaceDetailsScreen
                                  onTap: () => Navigator.of(context).pushNamed(
                                      PlaceDetailsScreen.routeName,
                                      arguments: greatPlaces.items[i].id)),
                            );
                    }),
      ),
    );
  }
}
