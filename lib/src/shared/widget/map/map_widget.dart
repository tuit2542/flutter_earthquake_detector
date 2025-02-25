import 'package:flutter/material.dart';
import 'package:flutter_earthquake_detector/src/services/map/location.service.dart';
import 'package:flutter_earthquake_detector/src/shared/style/theme_style.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_compass/flutter_map_compass.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class MapWidget extends StatefulWidget {
  LatLng initialLocation;

  final String urlTemplate;

  final String domainName;

  double mapRotation;

  final MapController mapController;

  final Function(MapEvent)? mapEvent;

  final List<Widget> children;

  final double mapHeight;

  final EdgeInsetsGeometry margin;

  final double zoomLevel;

  final bool hasOptionIcon;

  final bool hasCompass;

  final bool hasUserMarker;

  final bool isLoading;

  MapWidget({
    super.key,
    required this.initialLocation,
    required this.mapRotation,
    required this.mapController,
    required this.zoomLevel,
    this.urlTemplate = "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
    this.domainName = 'com.example.app',
    this.mapEvent,
    this.children = const [],
    this.mapHeight = 300,
    this.margin = const EdgeInsets.all(0),
    this.hasOptionIcon = false,
    this.hasCompass = true,
    this.isLoading = false,
    this.hasUserMarker = true,
  });

  @override
  State<MapWidget> createState() => _MapWidget();
}

// ignore: must_be_immutable
class _MapWidget extends State<MapWidget> {
  double _zoomLevel = 5.0;
  late final MapController _mapController = widget.mapController;
  late LatLng currentLatLng = widget.initialLocation;

  @override
  void initState() {
    super.initState();
  }

  void _zoomIn() {
    setState(() {
      _zoomLevel += 1;
      widget.mapController.move(_mapController.camera.center, _zoomLevel);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel -= 1;
      widget.mapController.move(_mapController.camera.center, _zoomLevel);
    });
  }

  void _recenter() async {
    await _goToCurrentLocation();

    setState(() {
      widget.mapController.rotate(0);
      widget.mapController.move(currentLatLng, _zoomLevel);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: SystemColors.thirdNeutralGreyColor,
          height: 300,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Container(
      height: widget.mapHeight,
      margin: widget.margin,
      child: FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          initialCenter: currentLatLng,
          initialZoom: widget.zoomLevel,
          onMapEvent: widget.mapEvent,
        ),
        children: [
          TileLayer(
            urlTemplate: widget.urlTemplate,
            userAgentPackageName: widget.domainName,
          ),
          // const MapCompass.cupertino(),
          if (widget.hasUserMarker) CurrentLocationLayer(),
          if (widget.hasCompass)
            MapCompass(
                icon: Icon(
              Icons.navigation,
              color: widget.mapRotation % 90 == 0
                  ? SystemColors.textRejectColor
                  : SystemColors.fourthNeutralGreyColor,
            )),
          if (widget.children.isNotEmpty)
            ...widget.children.map((Widget item) => item),
          if (widget.hasOptionIcon)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 🔹 Zoom In Button
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _zoomIn,
                      ),
                      const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey), // 🔹 เส้นคั่น
                      // 🔹 Zoom Out Button
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _zoomOut,
                      ),
                      const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey), // 🔹 เส้นคั่น

                      // 🔹 Re-Center Button
                      IconButton(
                        icon: const Icon(Icons.my_location),
                        onPressed: _recenter,
                      ),
                    ],
                  )),
            ),
        ],
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    try {
      final LocationService locationService = LocationService();

      Position position = await locationService.getCurrentLocation();
      LatLng userLocation = LatLng(position.latitude, position.longitude);
      setState(() {
        currentLatLng = userLocation;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("เกิดข้อผิดพลาด: $e")),
      );
    }
  }
}
