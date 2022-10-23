import 'dart:convert';

import 'package:drugs/screens/cart_page.dart';
import 'package:drugs/screens/drug_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/drugmodels/drug_model.dart';

class Home_Page extends StatefulWidget {
  String? username;
  Home_Page({super.key, this.username});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Future<List<DrugsModel>?>? getResult;

  Future<List<DrugsModel>> getData() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body) as List;
      List<DrugsModel> drug = json.map((e) => DrugsModel.fromjson(e)).toList();
      return drug;
    }

    return List.empty();
  }

  @override
  void initState() {
    super.initState();

    getResult = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Лекарства',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder<List<DrugsModel>?>(
          future: getResult,
          builder: (BuildContext context,
              AsyncSnapshot<List<DrugsModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<DrugsModel?>? drug = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${widget.username}',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: drug?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return ValyutaWidget(drug?[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget ValyutaWidget(drug) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Drug_Info_Page(
                getResult: drug ?? '',
              ),
            ),
          );
        },
        child: Dismissible(
          behavior: HitTestBehavior.deferToChild,
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: const Center(
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              showDeleteDialog(drug.id);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF5F7FA),
                  ),
                  height: 158,
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Image.network(drug?.imageUrl ?? ''),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    drug?.name ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          "${drug?.price ?? ''} сум",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 24,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          color: Color(0xffFFC000),
                        ),
                        child: Center(
                          child: Text(
                            "${drug?.quantity ?? ''}/гр",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void callDelete(num? id) async {
    String url =
        "https://pharmacy-app-management.herokuapp.com/api/drugs/${id}";

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('SUCCESS'),
              content: Text(response.body.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Home_Page(
                              username: widget.username,
                            ),
                          ),
                          ModalRoute.withName("/"));
                    });
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('ERROR'),
              content: Text(response.body.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  void showDeleteDialog(num? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete ??"),
            content: const Text("Rostdan ham o'chirmoqchimisiz ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    getData();
                    Navigator.pop(context);
                    callDelete(id);
                  },
                  child: const Text("Yes")),
            ],
          );
        });
  }
}
