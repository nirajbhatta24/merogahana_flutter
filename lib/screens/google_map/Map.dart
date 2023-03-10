import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Googlemaps extends StatefulWidget {
  const Googlemaps({super.key});

  @override
  State<Googlemaps> createState() => _GooglemapsState();
}

class _GooglemapsState extends State<Googlemaps> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng mylocation = const LatLng(27.7111651, 85.3483953);
  LatLng kaushal = const LatLng(27.7127356, 85.3459928);
  
  @override
  void initState() {
    markers.add(
      Marker(
          markerId: MarkerId(mylocation.toString()),
          position: mylocation,
          infoWindow: const InfoWindow(
              title: 'Niraj ko chiya pasal', snippet: "Shoe shop"),
          icon: BitmapDescriptor.defaultMarker),
    );
    markers.add(
      Marker(
          markerId: MarkerId(kaushal.toString()),
          position: kaushal,
          infoWindow: const InfoWindow(
              title: 'kaushal ko chiya pasal', snippet: "Shoe shop"),
          icon: BitmapDescriptor.defaultMarker),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: mylocation, 
          zoom: 10),
          markers: markers,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          }),
    );
  }
}
