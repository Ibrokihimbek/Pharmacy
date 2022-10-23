import 'dart:convert';

import 'package:drugs/models/drugmodels/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var formKey = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  int price = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Admin Page',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    onSaved: (val) {
                      name = val ?? "";
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    onSaved: (val) {
                      desc = val ?? "";
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    onSaved: (val) {
                      price = int.parse(val ?? '0');
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Price',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    onSaved: (val) {
                      quantity = int.parse(val ?? '0');
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Quantity',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    formKey.currentState!.save();

                    var medicine = DrugsModel(
                      name: name,
                      description: desc,
                      price: price,
                      imageUrl:
                          'https://apteka.uz/upload/iblock/6d7/6d7e7d1f0b0f604a1b6a21a796c4c8b9.jpeg',
                      quantity: quantity,
                    );

                    postMedicine(medicine);
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 173, 33, 243),
                          Color.fromARGB(255, 207, 179, 236),
                        ])),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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

  void postMedicine(DrugsModel medicine) async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    var response = await http.post(Uri.parse(url),
        body: jsonEncode(medicine.toJson()), headers: headers);

    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Info'),
            content: Text(response.body.toString()),
          );
        },
      );
    }
  }
}
