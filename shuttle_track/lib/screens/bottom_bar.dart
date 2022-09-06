import 'package:flutter/material.dart';
import 'package:shuttle_track/screens/Drawer.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuttle_track/screens/bottomnavigation/bottomnavbar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(6.6685496, -1.5744682);
  Set<Marker> markers = {};
  static const Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId("_kGooglePlex"),
      infoWindow: InfoWindow(title: 'Google plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(6.6685496, -1.5744682));
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final Marker _kLakeMarker = Marker(
      markerId: const MarkerId("_kLakeMarker"),
      infoWindow: const InfoWindow(title: 'Google plex'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: const LatLng(6.5685496, -1.5644682));

  static const Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [LatLng(6.6685496, -1.5744682), LatLng(6.5685496, -1.5644682)],
      width: 5);

  static const Polygon _kPolygon = Polygon(
      polygonId: PolygonId('_kPolygon'),
      points: [
        LatLng(6.5685496, -1.5644682),
        LatLng(6.6685496, -1.5744682),
        LatLng(6.53, -1.59),
        LatLng(6.51, -1.59),
      ],
      strokeWidth: 5,
      fillColor: Colors.transparent
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: FloatingActionButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.5),
        markers: {_kGooglePlexMarker, _kLakeMarker},
        polylines: {_kPolyline},
        polygons: {_kPolygon},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await _determinePosition();
          mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 13)));
          markers.clear();
          markers.add(Marker(
              markerId: const MarkerId("currentLocation"),
              position: LatLng(position.latitude, position.longitude)));
          setState(() {});
        },
        child: const Icon(Icons.location_searching),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: BottomNavBar(),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are denied permanently");
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
