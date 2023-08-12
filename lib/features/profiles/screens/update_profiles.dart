import 'package:flutter/material.dart';
import 'package:super_track/common/button.dart';
import 'package:super_track/constants/colors.dart';
import 'package:super_track/common/textfileds.dart';
import 'package:provider/provider.dart';
import 'package:super_track/providers/profiles_provider.dart';

class SuperTrackUpdateProfilesScreen extends StatefulWidget {
  final int index;
  const SuperTrackUpdateProfilesScreen({
    super.key,
    required this.index,
  });

  @override
  State<SuperTrackUpdateProfilesScreen> createState() =>
      _SuperTrackUpdateProfilesScreenState();
}

class _SuperTrackUpdateProfilesScreenState
    extends State<SuperTrackUpdateProfilesScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();

  final int colorIndex = 0;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    balanceController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Update Profile',
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceSize.height / 10,
            ),
            Text(
              'New Changes',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldsAddUserProfile(
              controller: balanceController,
              hintText: 'Profile\'s Balance',
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profilesColor.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: profilesColor[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            superTrackAddButton(
              onPressed: () {
                context.read<NewProfilesProvider>().updateProfile(
                      key: context
                          .read<NewProfilesProvider>()
                          .profiles
                          .keys
                          .toList()[widget.index],
                      mapValue: balanceController.text,
                    );
                Navigator.pop(context);
              },
              buttonText: 'Update Profile',
            ),
          ],
        ),
      )),
    );
  }
}
