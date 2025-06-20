import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationStable extends StatefulWidget {
  LocationStable({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<LocationStable> createState() => LocationStableState();
}

class LocationStableState extends State<LocationStable> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _initialCameraPosition;
  Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 8.0,
    );

    _markers.add(
      Marker(
        markerId: MarkerId('location'),
        position: LatLng(widget.latitude, widget.longitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToLocation,
          label: const Text('Go to location'),
          icon: const Icon(Icons.location_on),
        ),
      ),
    );
  }

  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 16.0,
          bearing: 200000,
          tilt: 60,
        ),
      ),
      // duration: Duration(seconds: 3),  // قم بضبط المدة حسب رغبتك
    );
  }
}
