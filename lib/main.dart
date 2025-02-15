import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/app.dart';

Future main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initEnvFile();
    runApp(const MyApp());
  } catch (e) {
    print("main Error \nMessage: $e");
  }
}

Future<void> initEnvFile() async {
  try {
    await dotenv.load(fileName: "environments/.env");
  } catch (e) {
    log("initEnvFile Error \nMessage: $e");
  }
}
