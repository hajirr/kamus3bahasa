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
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 6,
                ),
                Lottie.asset("assets/json/about.json"),
                const SizedBox(
                  height: 50,
                ),
                Text("Tentang Kami", style: TextStyle(color: Colors.blue)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  width: Get.width,
                  height: 75,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 0.4,
                        blurRadius: 6)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Penyusun:",
                          style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue)),
                      Text("- Ahdi Zukhruf Amri, M.Pd",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Text("- Dra. Hj. Entik Atikoh, M.Si",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: Get.width,
                  height: 75,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 0.4,
                        blurRadius: 6)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Pembuat:",
                          style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue)),
                      Text("- bco.co.id (Muhajir)",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Text("- Asiatul Jannah Foundation",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: Get.width,
                  height: 75,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 0.4,
                        blurRadius: 6)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Sponsor:",
                          style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue)),
                      Text("- Dewan Kesenian Cilegon",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Text("- Teater Wonk Kite",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Text("- Kecamatan Citangkil",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Kamus 3 Bahasa"),
          elevation: 0,
        ),
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
                  children: [
                    const Text("KAMUS 3 BAHASA",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<MyController>(
                      builder: (_) {
                        return Text(
                          controller.quotes[
                              Random().nextInt(controller.quotes.length)],
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                        );
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () =>
                    showSearch(context: context, delegate: SearchKamus()),
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
