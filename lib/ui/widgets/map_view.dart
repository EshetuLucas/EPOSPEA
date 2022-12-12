import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatelessWidget {
  final double lat;
  final double long;

  GoogleMapPage({
    required this.lat,
    required this.long,
  });
  List<Marker> get _markers => [
        Marker(
          markerId: MarkerId('map'),
          draggable: true,
          position: LatLng(lat, long),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markers),
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, long), zoom: 15),
      ),
    );
  }
}
