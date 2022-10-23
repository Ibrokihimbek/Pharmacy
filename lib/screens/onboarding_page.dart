import 'package:drugs/models/drugmodels/onboarding_model.dart';
import 'package:drugs/screens/admin_or_home.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:drugs/screens/welcome_page.dart';
import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardinPage extends StatefulWidget {
  const OnboardinPage({super.key});

  @override
  State<OnboardinPage> createState() => _OnboardinPageState();
}

int currentIndex = 0;
PageController pageController = PageController();
String NextButton = 'Next';

class _OnboardinPageState extends State<OnboardinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 620,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 2) {
                      NextButton = 'Done';
                    } else {
                      NextButton = 'Next';
                    }
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: OnboardingModel.onboard.length,
                itemBuilder: (BuildContext context, int index) {
                  return OnboardItem(OnboardingModel.onboard[index]);
                },
              ),
            ),
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      saveLogin(context);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    ),
                  ),
                  postIndicator(currentIndex),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 1) {
                        NextButton = 'Done';
                      }
                      setState(() {
                        if (currentIndex == 2) {
                          saveLogin(context);
                        }

                        pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.ease);
                      });
                    },
                    child: Text(
                      NextButton,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xff4157FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget OnboardItem(OnboardingModel onboard) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Image.asset(
          onboard.imageName,
          width: 291,
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              onboard.title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              onboard.content,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: const Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget postIndicator(int currentIndex) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      height: 42,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? const Color(0xff4157FF)
                  : const Color(0xffC4C4C4),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 4);
        },
      ),
    );
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(),
      ),
    );
  }
}
