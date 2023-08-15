import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:super_track/providers/profiles_database.dart';
import 'package:super_track/routers/routers_name.dart';

class SuperTrackProfilesScreen extends StatefulWidget {
  const SuperTrackProfilesScreen({super.key});

  @override
  State<SuperTrackProfilesScreen> createState() =>
      _SuperTrackProfilesScreenState();
}

class _SuperTrackProfilesScreenState extends State<SuperTrackProfilesScreen> {
  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<SuperTrackProfilesHiveProvider>(
        builder: (context, value, child) {
          return Scaffold(
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
                      Navigator.pushNamed(
                        context,
                        addProfileScreen,
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
                itemCount: value.hiveProfiles.length,
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
                                        Navigator.pushNamed(
                                          context,
                                          updateProfileScreen,
                                          arguments: index,
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
                                              contentPadding:
                                                  EdgeInsets.all(50),
                                              backgroundColor: profilesColor[3],
                                              content: Text(
                                                'Are you sure you want to Delete this profile ?',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    value.removeFromDatabase(
                                                      index: index,
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
                        Navigator.pushNamed(
                          context,
                          homeScreen,
                          arguments: index,
                        );
                      },
                      child: ListTile(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        tileColor: profilesColor[2],
                        title: Text(value.hiveProfiles.getAt(index).username),
                        trailing: Text(
                          "\$" + value.hiveProfiles.getAt(index).balance,
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
          );
        },
      ),
    );
  }
}
