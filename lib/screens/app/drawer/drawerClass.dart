import 'package:clothing/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../routes/app_router.dart';
import '../../../routes/screen_name.dart';
import 'drawer_item.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.black,
      width: 264,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () =>
                  AppRouter.goToAndRemove(screenName: ScreenName.mainScreen, arguments:  3),
              contentPadding: const EdgeInsets.only(top: 10, left: 15),
              visualDensity:
                  const VisualDensity(horizontal: VisualDensity.minimumDensity),
              leading: Container(
                margin: const EdgeInsetsDirectional.only(end: 10),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ImageManager.personImage,
                ),
              ),
              title: const Text(
                StringManager.personName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text(
                StringManager.personJob,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsetsDirectional.only(end: 66, bottom: 28),
              children: [
                drawerItem(
                  imageIcon: ImageManager.favoriteImage,
                  title: StringManager.myFavorite,
                  onTap: () =>
                      AppRouter.goToAndRemove(screenName: ScreenName.mainScreen, arguments:  2),
                ),
                drawerItem(
                  imageIcon: ImageManager.walletImage,
                  title: StringManager.wallet,
                  onTap: () {},
                ),
                drawerItem(
                  imageIcon: ImageManager.orderImage,
                  title: StringManager.myOrders,
                  onTap: () =>
                      AppRouter.goToAndRemove(screenName: ScreenName.mainScreen, arguments:  1),
                ),
                drawerItem(
                  imageIcon: ImageManager.aboutImage,
                  title: StringManager.aboutAs,
                  onTap: () {},
                ),
                drawerItem(
                  imageIcon: ImageManager.privacyImage,
                  title: StringManager.privacy,
                  onTap: () {},
                ),
                drawerItem(
                  imageIcon: ImageManager.settingImage,
                  title: StringManager.settings,
                  onTap:() => AppRouter.goTo(screenName: ScreenName.settingsScreen),
                ),
                const SizedBox(height: 60),
                drawerItem(
                  imageIcon: ImageManager.logoutImage,
                  title: StringManager.logout,
                  onTap: () {
                    setState(() {
                      SharedPrefController()
                          .setValue(PrefKeys.loggedIn.name, false);
                      Future.delayed(
                          const Duration(milliseconds: 500),
                          () => AppRouter.goToAndRemove(screenName: ScreenName.loginScreen));
                    });
                  },
                ),
                Container(
                    alignment: AlignmentDirectional.bottomStart,
                    padding:
                        const EdgeInsetsDirectional.only(start: 25, top: 30),
                    child: Image.asset(
                      ImageManager.mainIcon,
                      height: 60,
                      width: 52,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
