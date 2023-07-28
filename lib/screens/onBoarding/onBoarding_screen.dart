import 'package:clothing/constants.dart';
import 'package:clothing/routes/app_router.dart';
import 'package:clothing/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'widgets/singleIndicator.dart';
import 'widgets/onboard_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${_pageIndex + 1}'),
                  Text(
                    '/',
                    style: TextStyle(
                        color: _pageIndex != 2 ? Colors.grey : Colors.black),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                        color: _pageIndex != 2 ? Colors.grey : Colors.black),
                  ),
                  const Spacer(),
                  Align(
                    child: TextButton(
                      onPressed: () {
                        AppRouter.goToAndRemove(screenName: ScreenName.loginScreen);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                      ),
                      child: const Text(StringManager.skip),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                // physics: const BouncingScrollPhysics(),
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _pageIndex = pageIndex;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  OnBoardingContent(
                    image: ImageManager.onBoardingImage1,
                    title: StringManager.onBoardingTitle1,
                    desc: StringManager.onBoardingDesc1,
                  ),
                  OnBoardingContent(
                    image: ImageManager.onBoardingImage2,
                    title: StringManager.onBoardingTitle2,
                    desc: StringManager.onBoardingDesc2,
                  ),
                  OnBoardingContent(
                    image: ImageManager.onBoardingImage3,
                    title: StringManager.onBoardingTitle3,
                    desc: StringManager.onBoardingDesc3,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(ColorManager.mainColor),
                  minimumSize: const Size(218, 59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(133),
                  )),
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutQuad);
                if (_pageIndex == 2) {
                  AppRouter.goToAndRemove(screenName: ScreenName.loginScreen);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _pageIndex == 2 ? StringManager.start : StringManager.next,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Indicator(
                    isVisible: true,
                    color: _pageIndex == 0 ? Colors.white : Colors.white54,
                  ),
                  Indicator(
                    isVisible:
                        _pageIndex == 1 || _pageIndex == 2 ? true : false,
                    color: _pageIndex == 1 ? Colors.white : Colors.white54,
                  ),
                  Indicator(
                    isVisible: _pageIndex == 2 ? true : false,
                    color: _pageIndex == 2 ? Colors.white : Colors.white54,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
