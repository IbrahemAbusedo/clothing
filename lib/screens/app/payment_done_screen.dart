import 'package:clothing/constants.dart';
import 'package:clothing/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class PaymentDoneScreen extends StatelessWidget {
  const PaymentDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            width: 208,
            height: 208,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(104),
                border: Border.all(
                  width: 15,
                  color: const Color(ColorManager.mainColor),
                )),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                // width: 80,
                // height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(104),
                  color: const Color(ColorManager.mainColor).withOpacity(0.10),
                ),
                child: const Icon(
                  Icons.done_rounded,
                  color: Color(ColorManager.mainColor),
                  size: 60,
                ),
              ),
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(top: 84, bottom: 10),
            child: Text(
              'Congratulation!!!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const Text(
            '''       Payment is the transfer of money 
services in exchange product or Payments ''',
            style: TextStyle(
                height: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 15),
            child: SubmitButton(
              text: 'Get your receipt',
              onPressed: () {},
            ),
          ),
          SubmitButton(
            text: 'Back to Home',
            background: const Color(0xffFFE9E2),
            color: const Color(ColorManager.mainColor),
            onPressed: () {
              AppRouter.goToAndRemove(screenName: ScreenName.mainScreen);
            },
          ),
        ],
      ),
    );
  }
}
