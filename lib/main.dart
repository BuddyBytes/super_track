// ignore_for_file: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:super_track/constants/hive_constants.dart';
import 'package:super_track/db/hive%20model/profilesDb.dart';
import 'package:super_track/features/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:super_track/providers/profiles_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the Hive package
  await Hive.initFlutter();

  // register the adapter to store the data as an object in database
  Hive.registerAdapter(SuperTrackProfilesLocalDbAdapter());

  // create new box to store the application profiles
  await Hive.openBox<SuperTrackProfilesLocalDb>(hiveBoxProfiles);

  // create new box to store the application profiles's expanses and all other related stuffs
  // await Hive.openBox<SuperTrackProfilesLocalDb>(hiveBoxExpanses);

  runApp(
    // wrap all the app's screen with providers (public access)
    const SuperTrack(),
  );
}

class SuperTrack extends StatelessWidget {
  const SuperTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SuperTrackProfilesHiveProvider(),
      child: MaterialApp(
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
      ),
    );
  }
}
