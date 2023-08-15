import 'package:flutter/material.dart';
import 'package:super_track/features/charts/screens/expanses_chart.dart';
import 'package:super_track/features/expanses/screens/expanses_screen.dart';
import 'package:super_track/features/profiles/screens/add_profiles_screen.dart';
import 'package:super_track/features/profiles/screens/profiles_screen.dart';
import 'package:super_track/features/profiles/screens/update_profiles.dart';
import 'package:super_track/features/splash/screens/splash_screen.dart';
import 'package:super_track/routers/routers_name.dart';

import '../features/home/screens/home_screen.dart';

Route<dynamic> superTrackRouteCountrollers(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackSplashScreen(),
      );
    case profileScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackProfilesScreen(),
      );
    case addProfileScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackAddProfilesScreen(),
      );
    case updateProfileScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackUpdateProfilesScreen(
          index: args as dynamic,
        ),
      );
    case homeScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackHomeScreen(
          index: args as dynamic,
        ),
      );
    case addExpansesScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackExpansesScreens(),
      );
    case chartScreen:
      return MaterialPageRoute(
        builder: (_) => SuperTrackExpansesChart(),
      );
    default:
      throw "Error This page is not supported";
  }
}
