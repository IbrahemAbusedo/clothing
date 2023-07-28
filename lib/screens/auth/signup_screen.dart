import 'package:clothing/constants.dart';
import 'package:clothing/screens/auth/widgets/accounts_icons.dart';
import 'package:clothing/screens/auth/widgets/rich_text.dart';
import 'package:clothing/screens/auth/widgets/submit_button.dart';
import 'package:clothing/screens/auth/widgets/or_divider.dart';
import 'package:clothing/screens/auth/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  late TextEditingController _userEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _userEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _userEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55, bottom: 38),
              child: Image.asset(
                ImageManager.mainIcon,
                height: 62,
                width: 54,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 33),
              child: Text(
                StringManager.signUp,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InputField(
              controller: _userEditingController,
              hintText: 'Name',
              imageIcon: ImageManager.userImage,
              bottom: 11,
            ),
            InputField(
              controller: _emailEditingController,
              hintText: 'Email',
              imageIcon: ImageManager.emailImage,
              textType: TextInputType.emailAddress,
              bottom: 11,
            ),
            InputField(
              controller: _passwordEditingController,
              hintText: 'Password',
              imageIcon: ImageManager.passwordImage,
              obscure: true,
              bottom: 11,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: RichTexts(
                question: 'I accept all the ',
                answer: 'Terms & Conditions',
                onPressed: () {
                  AppRouter.goTo(screenName: ScreenName.loginScreen);
                },
              ),
              visualDensity: const VisualDensity(
                vertical: VisualDensity.minimumDensity,
                horizontal: VisualDensity.minimumDensity,
              ),
              activeColor: const Color(ColorManager.mainColor),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
              value: isChecked,

              onChanged: (bool? value) {
                if (value != null) {
                  setState(() => isChecked = value);
                }
              },
            ),
            SubmitButton(
              text: StringManager.signUp,
              onPressed: () {
                AppRouter.back();
              },
            ),
            const OrDivider(top: 17, bottom: 21),
            const AccountsIcons(),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: RichTexts(
                  question: 'Already have an account? ',
                  answer: 'Log In',
                  onPressed: () {
                    AppRouter.goTo(screenName: ScreenName.loginScreen);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
