import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kamus3bahasa/controllers/controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
            child: myController.items!.isNotEmpty
                ? ListView.builder(
                    itemCount: myController.items!.length,
                    itemBuilder: (contex, index) {
                      return Text(myController.items![index]['bahasa']);
                    })
                : const Center(
                    child: Text("Tidak ada data"),
                  )),
      ),
    );
  }
}
