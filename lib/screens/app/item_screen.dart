import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/color_toggle.dart';
import 'package:clothing/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFF2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                  ),
                  height: 44,
                  width: 44,
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      enableFeedback: false,
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() => clicked = !clicked),
                      icon: Icon(
                          clicked ? Icons.favorite : Icons.favorite_outline,
                          size: 24,
                          color: const Color(ColorManager.mainColor))),
                ),
              ],
            ),
          ),
          Center(
              child: Image.asset(
            ImageManager.shirt2Image,
            width: 272,
            height: 363,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 29, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '''Casual Henley
Shirts''',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '\$175',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    '''A Henley shirt is a collarless pullover shirt, by a round
neckline and a placket about 3 to 5 inches (8 to 13 cm)
long and usually having 2–5 buttons.''',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black45,
                        height: 1.4),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 16),
                    child: Text(
                      'Colors',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black45),
                    ),
                  ),
                  const ColorToggle(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 21),
                    child: Center(
                      child: SubmitButton(
                        text: 'Add to Cart',
                        onPressed: () {
                          AppRouter.goTo(screenName: ScreenName.myCartScreen);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
