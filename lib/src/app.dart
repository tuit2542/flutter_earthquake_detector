import 'package:flutter/material.dart';
// import 'package:flutter_earthquake_detector/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return Container();
            // HomeScreen();
          },
        );
      },
    );
  }
}
