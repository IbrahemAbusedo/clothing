import 'package:clothing/constants.dart';
import 'package:clothing/routes/screen_name.dart';
import 'package:clothing/screens/app/payment_card.dart';
import 'package:clothing/screens/app/widgets/address_list_tile.dart';
import 'package:clothing/screens/app/widgets/element_title.dart';
import 'package:clothing/screens/app/widgets/pilling_info_row.dart';
import 'package:clothing/screens/app/widgets/screen_appbar.dart';
import 'package:flutter/material.dart';
import '../../models/radio_model.dart';
import '../../routes/app_router.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<RadioModel> _sampleData = <RadioModel>[
    RadioModel(true, 'Home', '(342)  4522019', '220  New York'),
    RadioModel(false, 'Office', '(342)  4522019', '220  Montmartre,paris'),
  ];

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize:  Size.fromHeight(100),
          child: ScreenAppBar(title: 'Checkout'),
        ),
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: ElementTitle(title: 'Delivery address'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AddressListTile(sampleData: _sampleData),
              ),
              const ElementTitle(title: 'Billing information'),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        PillingInfoRow(
                            title: 'Delivery Fee     : ', cost: '\$50'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: PillingInfoRow(
                              title: 'Subtotal            :', cost: '\$740'),
                        ),
                        Divider(height: 5),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: PillingInfoRow(
                              title: 'Total                  :', cost: '\$790'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                child: ElementTitle(title: 'Payment Method'),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 55,
                ),
                child: GridView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  // padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (55/74),
                    crossAxisCount: 1,
                    mainAxisSpacing: 12,
                  ),
                  children: [
                    const PaymentCard(
                        image: ImageManager.applePayImage,
                        imageTitle: StringManager.dress),
                    PaymentCard(
                      image: ImageManager.visaImage,
                      imageTitle: StringManager.shirt,
                      onTap: () {
                        AppRouter.goTo(screenName: ScreenName.productScreen);
                      },
                    ),
                    const PaymentCard(
                        image: ImageManager.masterCardImage,
                        imageTitle: StringManager.pants),
                    const PaymentCard(
                      scale: 1.5,
                        image: ImageManager.palPayImage,
                        imageTitle: StringManager.tShirt),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 35),
                child: SwipeButton(
                  thumbPadding: const EdgeInsets.all(8),
                  activeTrackColor: const Color(ColorManager.mainColor),
                  activeThumbColor: Colors.white,
                  thumb: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(ColorManager.mainColor),
                  ),
                  elevationThumb: 2,
                  elevationTrack: 2,
                  child: const Text(
                    "Swipe for Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onSwipe: () {
                   setState(() {
                     Future.delayed(const Duration(microseconds: 500),() => AppRouter.goToAndRemove(screenName: ScreenName.paymentDoneScreen));
                   });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
