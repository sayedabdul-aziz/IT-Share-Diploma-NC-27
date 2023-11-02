import 'package:book_booster/core/app_colors.dart';
import 'package:book_booster/feature/auth/login_view.dart';
import 'package:book_booster/feature/onboarding/model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var pageCon = PageController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
              },
              child: const Text('Skip'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageCon,
                itemCount: model.length,
                onPageChanged: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(model[index].image, width: 300),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        model[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        model[index].desc,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageCon, // PageController
                      count: model.length,
                      effect: WormEffect(
                        activeDotColor: AppColor.lightPrimary,
                        dotHeight: 10,
                      ),
                      onDotClicked: (index) {}),
                  const Spacer(),
                  _index == (model.length - 1)
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColor.lightPrimary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Next',
                                style: TextStyle(color: AppColor.white),
                              )),
                        )
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
