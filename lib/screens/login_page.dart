import 'package:drugs/local_data/storage_repository.dart';
import 'package:drugs/screens/admin_or_home.dart';
import 'package:drugs/screens/create_accaunt_page.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:drugs/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
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
                const SizedBox(height: 60),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: const Color(0xff090F47),
                  ),
                ),
                const SizedBox(height: 35),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: myController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_outline_rounded,
                            size: 28,
                            color: Color(0xff090F47),
                          ),
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(height: 33),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            size: 28,
                            color: Color(0xff090F47),
                          ),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(height: 24),
                      InkWell(
                        borderRadius: BorderRadius.circular(56),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            StorageRepository.setString(
                                'name', myController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AdiminOrHomePage(),
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
                              'LOGIN',
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
                const SizedBox(height: 380),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
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
                            builder: (_) => CreateAccauntPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
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
}
