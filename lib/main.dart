import 'package:clothing/constants.dart';
import 'package:clothing/pref/shared_pref_controller.dart';
import 'package:clothing/routes/app_router.dart';
import 'package:clothing/routes/router_generator.dart';
import 'package:clothing/routes/screen_name.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: ScreenName.splashScreen ,
      navigatorKey: AppRouter.navigatorKey ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(ColorManager.backgroundColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
