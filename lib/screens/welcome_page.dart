import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Container(
                  width: 258,
                  height: 258,
                  child: Image.asset(MyImages.image_splash5),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Welcome to Medtech',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff090F47),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '''Do you want some help with your
          health to get better life?''',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: const Color(0xff090F47).withOpacity(0.45),
                  ),
                ),
                const SizedBox(height: 34),
                containerWidget(
                  'Sign up with email',
                  Colors.white,
                  const Color(0xff4157FF),
                  '',
                ),
                const SizedBox(height: 10),
                containerWidget(
                  'Continue with facebook',
                  const Color(0xff090F47).withOpacity(0.45),
                  Colors.white,
                  MyImages.image_facebook,
                ),
                const SizedBox(height: 10),
                containerWidget(
                  'Continue with Gmail',
                  const Color(0xff090F47).withOpacity(0.45),
                  Colors.white,
                  MyImages.image_google,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff090F47).withOpacity(0.45),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerWidget(
      String buttonName, Color colorWord, colorContainer, String icon) {
    return Container(
      width: 311,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        border: Border.all(color: Colors.grey, width: 1),
        color: colorContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 18,
            height: 18,
            child: buttonName == 'Sign up with email'
                ? Container()
                : Image.asset(icon),
          ),
          buttonName == 'Sign up with email'
              ? const SizedBox(width: 0)
              : const SizedBox(width: 18),
          Text(
            buttonName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: colorWord,
            ),
          ),
        ],
      ),
    );
  }
}
