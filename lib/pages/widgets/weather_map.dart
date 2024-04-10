import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class weatherMap extends StatefulWidget {
  const weatherMap({super.key});

  @override
  State<weatherMap> createState() => _weatherMapState();
}

class _weatherMapState extends State<weatherMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.736717, 100.523186),
    zoom: 4.0,
  );

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Map',
              style: GoogleFonts.playfairDisplay(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GoogleMap(
        mapType: MapType.none,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
