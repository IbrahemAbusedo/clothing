import 'package:clothing/constants.dart';
import 'package:clothing/screens/app/widgets/my_cart_order.dart';
import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:clothing/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(100),
        child: ScreenAppBar(title: 'My Cart'),
      ),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    MyCartOrder(
                      image: ImageManager.shirt2Image,
                      title: 'Henley Shirts',
                      subTitle: 250,
                    ),
                    MyCartOrder(
                      image: ImageManager.shirt4Image,
                      title: 'Casual Shirts',
                      subTitle: 145,
                    ),
                    MyCartOrder(
                      image: ImageManager.shirt3Image,
                      title: 'Casual Nolin',
                      subTitle: 225,
                    ),
                    MyCartOrder(
                      image: ImageManager.shirt5Image,
                      title: 'Casual Nolin',
                      subTitle: 225,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 150),
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 21, left: 21, bottom: 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'Subtotal   :',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        '\$750',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SubmitButton(
                    text: 'Checkout',
                    onPressed: () {
                      AppRouter.goTo(screenName: ScreenName.checkOutScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        // visible: leadingIconVisible,
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
        // title,
        '',
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }
}
