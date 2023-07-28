import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:clothing/screens/app/widgets/settings_item.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _update = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: ScreenAppBar(title: 'Settings')),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            const SettingsItem(
              icon: ImageManager.emailImage,
              title: 'Email Support',
            ),
            const SettingsItem(
              icon: ImageManager.faqsImage,
              title: 'FAQ',
            ),
            const SettingsItem(
              icon: ImageManager.bigPrivacyImage,
              title: 'Privacy Statement',
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(bottom: 25,left: 15,right: 10),
              activeColor: Colors.white,
              activeTrackColor: const Color(ColorManager.mainColor),
              inactiveThumbColor: Colors.grey.shade600,
              inactiveTrackColor: Colors.grey.shade300,
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          const Color(ColorManager.mainColor).withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 43,
                    height: 43,
                    child: Image.asset(
                      ImageManager.notificationImage,
                      scale: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Text('Notification'),
                  ),
                ],
              ),
              value: _notifications,
              onChanged: (bool value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.only(bottom: 25,left: 15,right: 10),
              activeColor: Colors.white,
              activeTrackColor: const Color(ColorManager.mainColor),
              inactiveThumbColor: Colors.grey.shade600,
              inactiveTrackColor: Colors.grey.shade300,
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          const Color(ColorManager.mainColor).withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 43,
                    height: 43,
                    child: Image.asset(
                      ImageManager.updateImage,
                      scale: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Text('Update'),
                  ),
                ],
              ),
              value: _update,
              onChanged: (bool value) {
                setState(() {
                  _update = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
