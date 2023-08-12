import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:super_track/features/home/screens/home_screen.dart';
import 'package:super_track/features/profiles/screens/add_profiles_screen.dart';
import 'package:provider/provider.dart';
import 'package:super_track/features/profiles/screens/update_profiles.dart';
import 'package:super_track/providers/profiles_provider.dart';

class SuperTrackProfilesScreen extends StatelessWidget {
  const SuperTrackProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: profilesColor[3],
                    duration: Duration(seconds: 1),
                    content: Text(
                      'Add New Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SuperTrackAddProfilesScreen();
                    }),
                  );
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: profilesColor[1],
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: context.watch<NewProfilesProvider>().profiles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onLongPress: () {
                    showModalBottomSheet(
                      backgroundColor: profilesColor[2],
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return SuperTrackUpdateProfilesScreen(
                                          index: index,
                                        );
                                      }),
                                    );
                                  },
                                  child: Text(
                                    'Upadate',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.all(50),
                                          backgroundColor: profilesColor[3],
                                          content: Text(
                                            'Are you sure you want to Delete this profile ?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<NewProfilesProvider>()
                                                    .removeProfile(
                                                      index: context
                                                          .read<
                                                              NewProfilesProvider>()
                                                          .profiles
                                                          .keys
                                                          .toList()[index],
                                                    );
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      230, 246, 235, 235),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SuperTrackHomeScreen(
                          index: index,
                        );
                      }),
                    );
                  },
                  child: ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    tileColor: profilesColor[2],
                    title: Text(
                      context
                          .watch<NewProfilesProvider>()
                          .profiles
                          .keys
                          .toList()[index]
                          .toString(),
                    ),
                    trailing: Text(
                      "\$" +
                          context
                              .watch<NewProfilesProvider>()
                              .profiles
                              .values
                              .toList()[index]
                              .toString(),
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
