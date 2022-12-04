import 'package:flutter/material.dart';
import 'package:kabarpagi/core/models/news/news_model.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/screens/home/home_screen.dart';
import 'package:kabarpagi/ui/screens/news/news_detail_screen.dart';
import 'package:kabarpagi/ui/screens/news/news_search_screen.dart';
import 'package:kabarpagi/ui/screens/setting/setting_screen.dart';

class RouterGenerator {

  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    /// Declaring argumen route
    final args = settings.arguments;
    switch(settings.name) {
      
      /// Home Group
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen(), settings: const RouteSettings(name: routeHome));
      
      /// News Group
      case routeNewsDetail:
        if (args is NewsModel) {
          return MaterialPageRoute(builder: (_) => NewsDetailScreen(
            news: args,
          ), settings: const RouteSettings(name: routeNewsDetail));
        }
        break;
      case routeNewsSearch:
        return MaterialPageRoute(builder: (_) => const NewsSearchScreen(), settings: const RouteSettings(name: routeNewsSearch));  

      /// Setting Group
      case routeSetting:
        return MaterialPageRoute(builder: (_) => const SettingScreen(), settings: const RouteSettings(name: routeSetting));

    }

    return null;
  }
}