// ignore_for_file: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:super_track/features/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:super_track/providers/profiles_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(
    ChangeNotifierProvider<NewProfilesProvider>(
      create: (context) => NewProfilesProvider(),
      child: const SuperTrack(),
    ),
  );
}

class SuperTrack extends StatelessWidget {
  const SuperTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: backGroundColor,
        primaryColor: primaryProfileColor,
        appBarTheme: AppBarTheme(
          backgroundColor: backGroundColor,
          elevation: 0,
        ),
      ),
      home: SuperTrackSplashScreen(),
    );
  }
}
