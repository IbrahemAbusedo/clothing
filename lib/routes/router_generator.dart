import 'package:clothing/screens/app/favorite_screen.dart';
import 'package:clothing/screens/app/my_orders_screen.dart';
import 'package:clothing/screens/app/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:clothing/routes/screen_name.dart';
import '../screens/app/check_out_screen.dart';
import '../screens/app/home_screen.dart';
import '../screens/app/item_screen.dart';
import '../screens/app/main_screen.dart';
import '../screens/app/my_cart_screen.dart';
import '../screens/app/payment_done_screen.dart';
import '../screens/app/product_screen.dart';
import '../screens/app/profile_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/onBoarding/onBoarding_screen.dart';
import '../screens/splash/splash.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var result;
    switch (settings.name) {
      case ScreenName.splashScreen:
        result = const SplashScreen();
        break;
      case ScreenName.onBoardingScreen:
        result = const OnBoardingScreen();
        break;
      case ScreenName.loginScreen:
        result = const LoginScreen();
        break;
      case ScreenName.signUpScreen:
        result = const SignupScreen();
        break;
      case ScreenName.mainScreen:
        final data = settings.arguments != null
              ? settings.arguments as int
            : null;
        result = MainScreen(
           data: data,
        );
        break;
      case ScreenName.homeScreen:
        result = const HomeScreen();
        break;
      case ScreenName.productScreen:
        result = const ProductScreen();
        break;
      case ScreenName.itemScreen:
        result = const ItemScreen();
        break;
      case ScreenName.myCartScreen:
        result = const MyCartScreen();
        break;
      case ScreenName.checkOutScreen:
        result = const CheckOutScreen();
        break;
        case ScreenName.favoriteScreen:
        result = const FavoriteScreen();
        break;
        case ScreenName.myOrdersScreen:
        result = const MyOrdersScreen();
        break;
        case ScreenName.paymentDoneScreen:
        result = const PaymentDoneScreen();
        break;
        case ScreenName.profileScreen:
            result =const  ProfileScreen();
        break;
        case ScreenName.settingsScreen:
        result = const SettingsScreen();
        break;

      // case ScreenName.settingsScreen:
      //   final data = settings.arguments != null
      //       ? settings.arguments as List<String>
      //       : [];
      //   result = SettingsScreen(
      //     listData: data as List<String>,
      //   );
      //   break;
      default:
        result = const Scaffold(
          body: Center(
            child: Text('Wrong path'),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}
