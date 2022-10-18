import 'package:drugs/models/drugmodels/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Drug_Info_Page extends StatefulWidget {
  DrugsModel getResult;
  Drug_Info_Page({Key? key, required this.getResult}) : super(key: key);

  @override
  State<Drug_Info_Page> createState() => _Drug_Info_PageState();
}

class _Drug_Info_PageState extends State<Drug_Info_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Информация о препарате",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF5F7FA),
              ),
              height: 158,
              width: double.infinity,
              child: Container(
                width: 200,
                height: 100,
                child: Image.network(widget.getResult.imageUrl ?? ''),
              ),
            ),
            const SizedBox(height: 80),
            Text(
              "Имя: ${widget.getResult.name ?? ''}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Цена: ${widget.getResult.price ?? ''} сум",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Miqdori: ${widget.getResult.quantity ?? ''}/гр",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Количество:\n${widget.getResult.description ?? ''}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
