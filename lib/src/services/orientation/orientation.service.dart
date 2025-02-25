import 'package:flutter/services.dart';

class OrientationService {
  // Private constructor to prevent direct instantiation
  OrientationService._();

  // Singleton instance
  static final OrientationService instance = OrientationService._();

  // Method to lock orientation to portrait
  Future<void> lockPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  // Method to lock orientation to landscape
  Future<void> lockLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
