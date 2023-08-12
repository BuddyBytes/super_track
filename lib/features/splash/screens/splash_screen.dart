import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';

import '../../profiles/screens/profiles_screen.dart';

class SuperTrackSplashScreen extends StatefulWidget {
  const SuperTrackSplashScreen({super.key});

  @override
  State<SuperTrackSplashScreen> createState() => _SuperTrackSplashScreenState();
}

class _SuperTrackSplashScreenState extends State<SuperTrackSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return SuperTrackProfilesScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceSize.height / 3,
              ),
              Icon(
                Icons.track_changes_rounded,
                size: 55,
                // color: primaryProfileColor,
              ),
              SizedBox(
                height: deviceSize.height / 25,
              ),
              Text(
                'S T',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: deviceSize.height / 3,
              ),
              CircularProgressIndicator(
                color: profilesColor[1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
