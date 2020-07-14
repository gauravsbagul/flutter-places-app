import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:places/model/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelection;

  MapScreen({
    this.initialLocation =
        const PlaceLocation(latitude: 37.422, longitude: -122.084),
    this.isSelection = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your map'),
        actions: [
          if (widget.isSelection)
            IconButton(
                icon: Icon(Icons.check),
                onPressed: _pickedLocation != null
                    ? () {
                        Navigator.of(context).pop(_pickedLocation);
                      }
                    : null)
        ],
      ),
      body: Center(
        child: const CircularProgressIndicator(),
      ),
      // GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(
      //       widget.initialLocation.latitude,
      //       widget.initialLocation.longitude,
      //     ),
      //     zoom: 16,
      //   ),
      //   onTap: widget.isSelection ? _selectLocation : null,
      //   markers: _pickedLocation == null
      //       ? null
      //       : {
      //           Marker(
      //             markerId: MarkerId('m1'),
      //             position: _pickedLocation,
      //           )
      //         },
      // ),
    );
  }
}