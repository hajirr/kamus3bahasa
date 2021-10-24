import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kamus3bahasa/controllers/controller.dart';
import 'package:kamus3bahasa/services/search_kamus.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.put(MyController());
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height / 3,
            child: Lottie.asset('assets/json/reading.json'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: const [
                Text("KAMUS 3 BAHASA",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "To learn a language is to have one more window from which to look at the word.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => showSearch(context: context, delegate: SearchKamus()),
            child: Container(
              margin: const EdgeInsets.all(8),
              width: Get.width / 1.3,
              height: Get.height / 11,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue]),
                  borderRadius: BorderRadius.circular(40)),
              child: const Center(
                  child: Text("Cari Kata",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    ));
  }
}
