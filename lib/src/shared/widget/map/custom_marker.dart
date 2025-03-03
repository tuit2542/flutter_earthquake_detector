import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class CustomMarker extends StatelessWidget {
  final double width;

  final double height;

  final bool disable;

  final double mapRotation;

  final Widget? markerIcon;

  final List<Map<String, dynamic>> markerList;

  final VoidCallback? onClick;

  const CustomMarker({
    super.key,
    required this.mapRotation,
    required this.markerList,
    this.width = 40,
    this.height = 40,
    this.disable = false,
    this.markerIcon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 40,
        size: const Size(40, 40),
        markers: [
          ...markerList.map(
            (item) => Marker(
              point: item['latlng'],
              width: width,
              height: height,
              child: markerIcon ??
                  InkWell(
                    onTap: disable ? () {} : onClick,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5), // 👈 Add margin here
                      child: Transform.rotate(
                        angle: -mapRotation * pi / 180,
                        child: const Icon(
                          Icons.wifi_tethering,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ],
        builder: (context, markers) {
          return Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              markers.length.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
