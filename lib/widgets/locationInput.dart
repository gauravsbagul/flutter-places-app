import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:places/screens/mapScreen.dart';
import '../helpers/locationHelper.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectplace;
  LocationInput(this.onSelectplace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl = '';

  void _showPriview(double lat, double lng) {
    final staticMapImage = LocationHelper.generateLocationPreviewImage(
        latitude: lat, longitude: lng);
    setState(() {
      _previewImageUrl = staticMapImage;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final _locationData = await Location().getLocation();
      _showPriview(_locationData.latitude, _locationData.longitude);
      widget.onSelectplace(_locationData.latitude, _locationData.longitude);
    } catch (error) {
      print('ERROR: ${error}');
    }
  }

  Future<void> _selectMap() async {
    final selctedLocation = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreen(
        isSelection: true,
      ),
    ));
    if (selctedLocation == null) {
      return;
    }
    _showPriview(selctedLocation.latitude, selctedLocation.longitude);
    widget.onSelectplace(selctedLocation.latitude, selctedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: _selectMap,
              icon: Icon(Icons.map),
              label: Text('Select on map'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}
