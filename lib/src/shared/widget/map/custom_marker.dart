import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.lat,
    required this.lng,
    required this.mapRotation,
    this.width = 40,
    this.height = 40,
    this.disable = false,
    this.widget,
  });

  final double lat;

  final double lng;

  final double width;

  final double height;

  final bool disable;

  final Widget? widget;

  final double mapRotation;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          point: LatLng(lat, lng),
          width: width,
          height: height,
          child: widget ??
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 5), // 👈 Add margin here
                child: Transform.rotate(
                  angle: -mapRotation * pi / 180,
                  child: Image.asset("assets/map/map_marker.png"),
                ),
              ),
        ),
      ],
    );
  }
}
