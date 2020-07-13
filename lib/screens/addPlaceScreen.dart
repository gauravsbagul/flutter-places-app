import 'package:flutter/material.dart';

import '../widgets/imageInput.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      SizedBox(height: 10),
                      ImageInput(),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              color: Theme.of(context).accentColor,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}