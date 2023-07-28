import 'package:clothing/screens/app/favorite_screen.dart';
import 'package:clothing/screens/app/home_screen.dart';
import 'package:clothing/screens/app/my_orders_screen.dart';
import 'package:clothing/screens/app/profile_screen.dart';
import 'package:clothing/screens/app/widgets/bottom_nav_indicator.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/screen_model.dart';

class MainScreen extends StatefulWidget {
   const MainScreen({Key? key, this.data }) : super(key: key);
  final int? data;

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    currentIndex = widget.data ?? 0;
  }

  final List<ScreenModel> _items = <ScreenModel>[
    const ScreenModel(HomeScreen()),
    const ScreenModel(MyOrdersScreen()),
    const ScreenModel(FavoriteScreen()),
    const ScreenModel(ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    //
    // ModalRoute? modalRoute = ModalRoute.of(context);
    // if (modalRoute != null) {
    //   if (modalRoute.settings.arguments != null) {
    //     if(modalRoute.settings.arguments is int) {
    //       currentIndex = modalRoute.settings.arguments as int;
    //     }
    //   }
    // }

    // onGenerateRoute: (settings) {
    //   if (settings.name == PassArgumentsScreen.routeName) {
    //     final ScreenArguments args = settings.arguments;
    // // final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: _items[currentIndex].widget,
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                BottomNavIndicator(isVisible: currentIndex == 0),
                IconButton(
                  enableFeedback: false,
                  onPressed: () => setState(() => currentIndex = 0),
                  icon: currentIndex == 0
                      ? const Icon(
                          Icons.home_filled,
                          color: Color(ColorManager.mainColor),
                          size: 28,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                ),
              ],
            ),
            Column(
              children: [
                BottomNavIndicator(isVisible: currentIndex == 1),
                IconButton(
                  enableFeedback: false,
                  onPressed: () => setState(() => currentIndex = 1),
                  icon: currentIndex == 1
                      ? const Icon(
                          Icons.shopping_cart,
                          color: Color(ColorManager.mainColor),
                          size: 28,
                        )
                      : const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                ),
              ],
            ),
            Column(
              children: [
                BottomNavIndicator(isVisible: currentIndex == 2),
                IconButton(
                  enableFeedback: false,
                  onPressed: () => setState(() => currentIndex = 2),
                  icon: currentIndex == 2
                      ? const Icon(
                          Icons.favorite_sharp,
                          color: Color(ColorManager.mainColor),
                          size: 28,
                        )
                      : const Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.black54,
                          size: 28,
                        ),
                ),
              ],
            ),
            Column(
              children: [
                BottomNavIndicator(isVisible: currentIndex == 3),
                IconButton(
                  enableFeedback: false,
                  onPressed: () => setState(() => currentIndex = 3),
                  icon: currentIndex == 3
                      ? const Icon(
                          Icons.person_rounded,
                          color: Color(ColorManager.mainColor),
                          size: 28,
                        )
                      : const Icon(
                          Icons.person_outline_rounded,
                          color: Colors.black54,
                          size: 28,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
