import 'package:drugs/screens/admin_or_home.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:drugs/screens/login_page.dart';
import 'package:drugs/screens/verify_otp_page.dart';
import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../local_data/storage_repository.dart';

class CreateAccauntPage extends StatefulWidget {
  const CreateAccauntPage({super.key});

  @override
  State<CreateAccauntPage> createState() => _CreateAccauntPageState();
}

class _CreateAccauntPageState extends State<CreateAccauntPage> {
  bool isPas = false;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final myControllerFoneNumber = TextEditingController();
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
                const SizedBox(height: 21),
                const Text(
                  'Create your account!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: const Color(0xff090F47),
                  ),
                ),
                const SizedBox(height: 35),
                FormField(),
                const SizedBox(height: 180),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      ),
                    ),
                  ],
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
            controller: myController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your Name";
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Your Name',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
          const SizedBox(height: 33),
          TextFormField(
            controller: myControllerFoneNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your mobile number";
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
          const SizedBox(height: 33),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
          const SizedBox(height: 33),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !isPas,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    setState(() {
                      isPas = !isPas;
                    });
                  });
                },
                icon: isPas
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              hintText: 'Password',
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
                StorageRepository.setString('name', myController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VerifyOtpPage(
                      phoneNumber: myControllerFoneNumber.text,
                    ),
                  ),
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
                  'CREATE ACCOUNT',
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
