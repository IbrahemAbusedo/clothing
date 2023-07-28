import 'package:flutter/material.dart';

import '../../../constants.dart';

class SettingsItem extends StatefulWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final String icon;
  final String title;
  final Function()? onTap;

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}
class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(ColorManager.mainColor).withOpacity(0.07),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 43,
          height: 43,
          child: Image.asset(
            widget.icon,
            scale: 2,
          ),
        ),
        title: Text(widget.title),
        trailing: IconButton(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
            onPressed:widget.onTap, icon: const Icon(Icons.arrow_forward_ios_rounded)),
        ),
    );
  }
}