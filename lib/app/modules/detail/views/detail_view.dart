import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(children: [
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                    Text(
                      "Kembali",
                      style: GoogleFonts.poppins(color: Colors.blue),
                    )
                  ]),
                ),
                Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Get.height * 0.05),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 12,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.bahasa,
                        style: GoogleFonts.poppins(
                          fontSize: Get.height * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.english,
                        style: GoogleFonts.poppins(
                          fontSize: Get.height * 0.02,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        controller.bebasan,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: Get.height * 0.03,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.3,
                )
              ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        child: const Icon(Icons.favorite_outline_outlined),
      ),
    );
  }
}
