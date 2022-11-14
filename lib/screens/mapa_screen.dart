import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocalizacion_v3/widgets/widgets.dart';
import '../provider/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  // const MapaScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScanModel ubicacion =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: ubicacion.getLatLng(),
      zoom: 17,
    );

    Set<Marker> markers = new Set<Marker>();

    markers.add(
      Marker(
        markerId: MarkerId('geo-location'),
        position: ubicacion.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: ubicacion.getLatLng(),
                      zoom: 17,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.location_searching_outlined))
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: CustomNavigatorBarMapa(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
