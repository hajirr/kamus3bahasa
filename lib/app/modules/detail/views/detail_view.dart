import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kamus3bahasa/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.bahasa),
        centerTitle: true,
        actions: [
          GetBuilder<DetailController>(
            builder: (_) {
              return IconButton(
                  onPressed: () {
                    controller.addBookmark(controller.bahasa);
                  },
                  icon: Icon(
                      controller.homeController.box.read(controller.bahasa) ==
                              true
                          ? Icons.bookmark
                          : Icons.bookmark_outline));
            },
          )
        ],
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
