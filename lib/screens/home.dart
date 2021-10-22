import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kamus3bahasa/controllers/controller.dart';
import 'package:kamus3bahasa/models/kamus.dart';
import 'package:kamus3bahasa/services/search_kamus.dart';

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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchKamus());
            },
            icon: const Icon(Icons.search))
      ],
    ));
  }
}
