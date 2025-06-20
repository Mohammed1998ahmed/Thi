import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/Location/logic/cubit/location_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thi/feature/Reservations/Location/ui/showBottomSheet.dart';

class Local1 extends StatefulWidget {
  Local1({Key? key}) : super(key: key);

  @override
  State<Local1> createState() => _Local1State();
}

class _Local1State extends State<Local1> {
  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> controller1 =
      Completer<GoogleMapController>();
  List<Placemark> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getDataClubList(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LocationCubit.getObject(context);
          print("mohammed ahmde");
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        title: "Search Loaction",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.38,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(
                                  255, 158, 158, 158)), // Add border
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: TypeAheadField<String>(
                          controller: _searchController,
                          suggestionsCallback: (pattern) async {
                            print(pattern);
                            if (pattern.isEmpty) return [];
                            return await searchPlace(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey), // Add border
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              child: ListTile(
                                title: text(title: suggestion),
                              ),
                            );
                          },
                          onSelected: (suggestion) async {
                            _searchController.text = suggestion;
                            await searchPlace(suggestion);
                          },
                          // onSuggestionSelected:
                        )),
                  ],
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(cubit.lat ?? 25.3463, cubit.long ?? 55.4209),
                  zoom: 8.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  controller1.complete(controller);
                  _mapController = controller;
                },
                markers: Set<Marker>.of([
                  Marker(
                    markerId: MarkerId('marker_id'),
                    position:
                        LatLng(cubit.lat ?? 25.3463, cubit.long ?? 55.4209),
                    infoWindow: InfoWindow(title: 'موقع المحدد'),
                  ),
                ]),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color0,
              onPressed: () {
                showBottomSheett(context,
                    cubitLocation: cubit, controller1: controller1);
              },
              child: Container(
                  child: Icon(
                Icons.menu_rounded,
                color: Color3,
                size: 35,
              )),
            ),
          );
        },
      ),
    );
  }

  Future<List<String>> searchPlace(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return [];
    }

    try {
      List<Location> locations = await locationFromAddress(query);
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude,
        locations[0].longitude,
      );

      setState(() {
        _searchResults = placemarks;
        _moveToPlace(locations[0]);
      });

      return placemarks.map((placemark) => placemark.name ?? '').toList();
    } catch (e) {
      print('Error searching place: $e');
      return [];
    }
  }

  void _moveToPlace(Location location) async {
    await _mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(location.latitude, location.longitude),
        zoom: 15,
      ),
    ));
  }

  Set<Marker> _buildMarkers() {
    return _searchResults.map((placemark) {
      return Marker(
        markerId: MarkerId(placemark.name ?? ''),
        infoWindow: InfoWindow(
          title: placemark.name ?? '',
          snippet: placemark.subThoroughfare != null
              ? '${placemark.thoroughfare}, ${placemark.subThoroughfare}'
              : placemark.thoroughfare ?? '',
        ),
      );
    }).toSet();
  }
}
