import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class CustomCurrentLocationLayer extends StatelessWidget {
  const CustomCurrentLocationLayer ({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      centerOnLocationUpdate: CenterOnLocationUpdate.always,
      turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
      style: const LocationMarkerStyle(
        marker: DefaultLocationMarker(
          child: Icon(
            Icons.navigation,
            color: Colors.white,
          ),
        ),
        markerSize: Size(20, 20),
        markerDirection: MarkerDirection.heading,
      ),
    );
  }
}