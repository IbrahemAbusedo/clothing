import 'package:clothing/constants.dart';
import 'package:clothing/pref/shared_pref_controller.dart';
import 'package:clothing/screens/auth/widgets/accounts_icons.dart';
import 'package:clothing/screens/auth/widgets/rich_text.dart';
import 'package:clothing/screens/auth/widgets/submit_button.dart';
import 'package:clothing/screens/auth/widgets/or_divider.dart';
import 'package:clothing/screens/auth/widgets/text_button.dart';
import 'package:clothing/screens/auth/widgets/text_field.dart';
import 'package:clothing/screens/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../../routes/screen_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }
  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }
  String? _errorEmail;
  String? _errorPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                'Log in',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InputField(
              errorText: _errorEmail,
              controller: _emailEditingController,
              hintText: 'Email',
              imageIcon: ImageManager.emailImage,
              textType: TextInputType.emailAddress,
              // errorEmail: errorTextValue,
              onChange: (value) {
                setState(() => _emailValidator());
              },
              bottom: 16,
            ),
            InputField(
              controller: _passwordEditingController,
              hintText: 'Password',
              imageIcon: ImageManager.passwordImage,
              onChange: (p0) => _passwordValidator(),
              errorText: _errorPassword,
              textType: TextInputType.visiblePassword,
              obscure: true,
              bottom: 16,
            ),
            const ForgetButton(),
            SubmitButton(
              text: StringManager.logIn,
              onPressed: () => _performLogin(),
            ),
            const OrDivider(top: 40, bottom: 31),
            const AccountsIcons(),
            Padding(
              padding: const EdgeInsets.only(top: 55),
              child: RichTexts(
                  question: 'Don’t have an account? ',
                  answer: ' Sign Up',
                  onPressed: () {
                    AppRouter.goTo(screenName: ScreenName.signUpScreen);
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    _emailValidator();
    if (_errorEmail == null && _emailEditingController.text.isNotEmpty) {
      _passwordValidator();
      if (_errorPassword == null &&
          _passwordEditingController.text.isNotEmpty) {
        return true;
      } else {
        setState(() => _errorPassword = 'Invalid password');
        return false;
      }
    } else {
      setState(() => _errorEmail = 'Enter email');
      return false;
    }
  }

  void _emailValidator() {
    setState(() {
      if (_emailEditingController.text.isNotEmpty) {
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(_emailEditingController.text)) {
          _errorEmail = 'invalid email';
        } else {
          _errorEmail = null;
        }
      } else {
        _errorEmail = null;
      }
    });
  }

  void _passwordValidator() {
    setState(() {
      if (_passwordEditingController.text.isNotEmpty) {
        if (_passwordEditingController.text.trim().length < 8) {
          _errorPassword = 'Password must be at least 8 characters in length';
        } else {
          _errorPassword = null;
        }
      } else {
        _errorPassword = null;
      }
    });
  }

  void _login() {
    context.showSnackBar(message: 'Logged in successfully');
    SharedPrefController().save(_emailEditingController.text);
    AppRouter.goToAndRemove(screenName: ScreenName.mainScreen);
  }
}
