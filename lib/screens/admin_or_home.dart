import 'package:drugs/screens/admin_page.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:drugs/screens/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdiminOrHomePage extends StatefulWidget {
  const AdiminOrHomePage({super.key});

  @override
  State<AdiminOrHomePage> createState() => _AdiminOrHomePageState();
}

class _AdiminOrHomePageState extends State<AdiminOrHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Home_Page(),
                      ),
                    );
                  },
                  child: const Text(
                    'Home Page',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdminPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Admin Page',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) => CupertinoAlertDialog(
                  title: const Text("Chiqmoqchimisiz!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: ((context) => CupertinoAlertDialog(
                                title: const Text("Rostdanham chiqmoqchimisiz"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => OnboardinPage()),
                                          ModalRoute.withName("/"));

                                      saveLogin(context);
                                    },
                                    child: const Text("Ha"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yo'q"),
                                  ),
                                ],
                              )),
                        );
                      },
                      child: const Text("Ha"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Yo'q"),
                    ),
                  ],
                )),
          );
        },
        child: const Icon(
          Icons.logout,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnboardinPage()));
  }
}
