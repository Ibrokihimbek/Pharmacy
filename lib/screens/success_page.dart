import 'package:drugs/screens/admin_or_home.dart';
import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuccessPage extends StatefulWidget {
  String username;
  SuccessPage({super.key, required this.username});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    width: 245,
                    height: 196,
                    child: Image.asset(MyImages.image_success),
                  ),
                ),
                const SizedBox(height: 51),
                Center(
                  child: Container(
                    child: const Text(
                      'Phone Number Verified',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: const Color(0xff090F47),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    child: Text(
                      '''      Congradulations, your phone
number has been verified. You can
              start using the app''',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 155),
                InkWell(
                  borderRadius: BorderRadius.circular(56),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AdiminOrHomePage(username: widget.username),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color(0xff4157FF),
                    ),
                    child: const Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
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
}
