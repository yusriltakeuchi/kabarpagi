import 'package:flutter/material.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/screens/home/home_screen.dart';

class RouterGenerator {

  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    /// Declaring argumen route
    // final args = settings.arguments;
    switch(settings.name) {
      
      /// Home Group
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen(), settings: const RouteSettings(name: routeHome));
    }

    return null;
  }
}