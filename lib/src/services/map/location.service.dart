import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  LocationService._internal();

  /// ตรวจสอบสิทธิ์และขอสิทธิ์ตำแหน่ง
  Future<void> _checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Please enable GPS.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Permission denied.");
      }
    }
    ///กรณีที่ถูก Always Denied 
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          "Permission permanently denied. Please enable it in Settings.");
    }
  }

  /// ดึงตำแหน่งปัจจุบัน
  Future<Position> getCurrentLocation() async {
    await _checkPermissions();
    return await Geolocator.getCurrentPosition();
  }

  /// ติดตามตำแหน่งแบบเรียลไทม์ (Stream)
  Stream<Position> getPositionStream(
      {LocationAccuracy accuracy = LocationAccuracy.high}) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: accuracy),
    );
  }
}
