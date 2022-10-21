import 'package:drugs/screens/admin_page.dart';
import 'package:drugs/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    );
  }
}
