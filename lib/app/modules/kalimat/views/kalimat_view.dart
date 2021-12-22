import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kalimat_controller.dart';

class KalimatView extends GetView<KalimatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KalimatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KalimatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
