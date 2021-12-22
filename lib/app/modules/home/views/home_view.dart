import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: Get.height * 0.38,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/conversations.png')),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: Get.width * 0.05),
                      height: Get.height * 0.1,
                      width: Get.width,
                      child: Column(children: [
                        Text(
                          "Kamus 3 Bahasa",
                          style: GoogleFonts.poppins(
                              fontSize: Get.height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Jawa Banten, Indonesia, Inggris",
                          style:
                              GoogleFonts.poppins(fontSize: Get.height * 0.02),
                        ),
                      ])),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: Get.height * 0.5,
                      child: GridView.count(
                        padding: EdgeInsets.all(Get.height * 0.05),
                        crossAxisCount: 2,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/team');
                            },
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.width * 0.35,
                              margin: EdgeInsets.only(
                                  bottom: Get.height * 0.02,
                                  left: Get.height * 0.01,
                                  right: Get.height * 0.02),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 12,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(Get.height * 0.04)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.black,
                                      size: Get.height * 0.07,
                                    ),
                                    Text(
                                      "Team",
                                      style: GoogleFonts.poppins(
                                          fontSize: Get.height * 0.025),
                                    )
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/favorite');
                            },
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.width * 0.35,
                              margin: EdgeInsets.only(
                                  bottom: Get.height * 0.02,
                                  left: Get.height * 0.02,
                                  right: Get.height * 0.01),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 12,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(Get.height * 0.04)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: Get.height * 0.07,
                                    ),
                                    Text(
                                      "Favorit",
                                      style: GoogleFonts.poppins(
                                          fontSize: Get.height * 0.025),
                                    )
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/kalimat');
                            },
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.width * 0.35,
                              margin: EdgeInsets.only(
                                left: Get.height * 0.01,
                                right: Get.height * 0.02,
                                top: Get.height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 12,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(Get.height * 0.04)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.list_alt,
                                      color: Colors.green,
                                      size: Get.height * 0.07,
                                    ),
                                    Text(
                                      "Kalimat",
                                      style: GoogleFonts.poppins(
                                          fontSize: Get.height * 0.025),
                                    )
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/translate');
                            },
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.width * 0.35,
                              margin: EdgeInsets.only(
                                  top: Get.height * 0.02,
                                  left: Get.height * 0.02,
                                  right: Get.height * 0.01),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 12,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(Get.height * 0.04)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.translate,
                                      color: Colors.white,
                                      size: Get.height * 0.07,
                                    ),
                                    Text(
                                      "Kamus",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: Get.height * 0.025),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ))
                ])));
  }
}
