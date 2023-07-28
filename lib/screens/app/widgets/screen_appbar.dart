import 'package:flutter/material.dart';
import '../../../routes/app_router.dart';
class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({
    super.key,
    required this.title,
    this.leadingIconVisible = true,
    this.popUpMenuVisible = false,
    this.bottomPadding = 0,
  });
final String title;
final bool leadingIconVisible;
final bool popUpMenuVisible;
final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: bottomPadding),
      child: AppBar(
        leading: Visibility(
          maintainSize: true,
          maintainInteractivity: true,
          maintainState: true,
          maintainAnimation: true,
          visible: leadingIconVisible,
          child: IconButton(
            padding: const EdgeInsets.only(left: 10),
            onPressed: ()=> AppRouter.back(),
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            ),
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        actions: [
          Visibility(
            maintainSize: true,
            maintainInteractivity: true,
            maintainState: true,
            maintainAnimation: true,
            visible: popUpMenuVisible,
            child: PopupMenuButton(itemBuilder: (context) {
              return List.empty();
            },),
          ),
        ],
      ),
    );
  }
}