import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.bahasa),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${controller.bahasa} is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
