import 'dart:async';

import 'package:drugs/screens/admin_or_home.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:drugs/screens/login_page.dart';
import 'package:drugs/screens/success_page.dart';
import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerifyOtpPage extends StatefulWidget {
  String username;
  String phoneNumber;
  VerifyOtpPage({
    super.key,
    required this.username,
    required this.phoneNumber,
  });

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _formKey = GlobalKey<FormState>();
  int start = 59;

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (start != 0) {
          setState(() {
            start--;
          });
        }
      },
    );
  }

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
                const Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
                const SizedBox(height: 21),
                const Text(
                  'Enter the verify code',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: const Color(0xff090F47),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '''We just send you a verification code via phone
${widget.phoneNumber}''',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: const Color(0xff090F47).withOpacity(0.45),
                  ),
                ),
                const SizedBox(height: 35),
                FormField(),
                const SizedBox(height: 180),
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          'The verify code will expire in 00:${start}',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Resend Code',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Color(0xff4157FF),
                          ),
                        ),
                      ],
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

  Widget FormField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter the password sent to your phone number";
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
              hintText: '0  0  0  0  0  0',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            borderRadius: BorderRadius.circular(56),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          SuccessPage(username: widget.username)),
                );
              }
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
                  'SUBMIT CODE',
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
    );
  }
}
