import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:super_track/features/charts/screens/chart_screen.dart';
import 'package:super_track/features/expanses/screens/expanses_screen.dart';
import 'package:provider/provider.dart';
import 'package:super_track/providers/profiles_database.dart';

class SuperTrackHomeScreen extends StatefulWidget {
  final int index;
  const SuperTrackHomeScreen({
    super.key,
    required this.index,
  });

  @override
  State<SuperTrackHomeScreen> createState() => _SuperTrackHomeScreenState();
}

class _SuperTrackHomeScreenState extends State<SuperTrackHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SuperTrackChartsScreen();
                }),
              );
            },
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 29,
              color: primaryCardColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.tag_faces,
                size: 29,
                color: primaryCardColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                color: primaryCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Balance'),
                          Text(
                            context
                                .watch<SuperTrackProfilesHiveProvider>()
                                .hiveProfiles
                                .getAt(widget.index)
                                .username,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '\$' +
                            context
                                .watch<SuperTrackProfilesHiveProvider>()
                                .hiveProfiles
                                .getAt(widget.index)
                                .balance,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status : Active'),
                          Text(
                              // context
                              //     .watch<NewProfilesProvider>()
                              //     .profiles
                              //     .keys
                              //     .toList()[widget.index],
                              '11/08/2023'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Logs',
                  style: TextStyle(
                    color: primaryProfileColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: backGroundColor,
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(12),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            tileColor: const Color.fromARGB(60, 158, 158, 158),
                            title: Text('Store\'s Expanses '),
                            leading: Icon(
                              index.isEven
                                  ? Icons.trending_up_sharp
                                  : Icons.trending_down_sharp,
                              color:
                                  index.isEven ? primaryCardColor : Colors.red,
                            ),
                            trailing: Text(
                              '\$24',
                              style: TextStyle(
                                color: primaryCardColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SuperTrackExpansesScreens();
            }),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: primaryProfileColor,
        elevation: 0,
      ),
    );
  }
}
