import 'package:clothing/constants.dart';
import 'package:clothing/routes/app_router.dart';
import 'package:clothing/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../../pref/shared_pref_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      bool loggedIn = SharedPrefController().getValue<bool>(PrefKeys.loggedIn.name)?? false;
      String route = loggedIn ? ScreenName.mainScreen : ScreenName.onBoardingScreen;
      AppRouter.goToAndRemove(screenName: route);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(ImageManager.mainIcon,height: 120,width: 104,),
      ),
    );
  }
}
