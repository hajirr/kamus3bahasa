import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          title: Text(
            'Kamus 3 Bahasa',
            style: GoogleFonts.buda(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: Get.height / 55),
                width: Get.width,
                height: Get.height / 8,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Get.height / 30),
                        bottomRight: Radius.circular(Get.height / 30))),
                child: Center(
                  child: Container(
                    width: Get.width / 1.1,
                    height: Get.height / 12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height / 10)),
                    child: Center(
                      child: TextField(
                          onChanged: (value) {
                            controller.searchWord = value;
                            controller.update();
                          },
                          style: GoogleFonts.roboto(fontSize: Get.height / 40),
                          controller: controller.searchWordController,
                          decoration: InputDecoration(
                              hintText: "Cari",
                              hintStyle: GoogleFonts.roboto(),
                              prefixIcon: Icon(CupertinoIcons.search,
                                  size: Get.height / 30),
                              border: InputBorder.none)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(Get.height / 50,
                        Get.height / 70, Get.height / 50, Get.height / 50),
                    width: Get.width / 30,
                    height: Get.height / 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Bank kata",
                    style: GoogleFonts.roboto(fontSize: Get.height / 40),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    Get.height / 70, 0, Get.height / 70, Get.height / 70),
                height: Get.height / 3,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(Get.height / 40),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          color: Colors.grey)
                    ]),
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    return ListView.builder(
                        itemCount: controller.results.length,
                        itemBuilder: (context, index) {
                          return controller.isLoading
                              ? const CircularProgressIndicator()
                              : controller.searchWord.isEmpty
                                  ? Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            Get.toNamed("/detail", arguments: [
                                              controller.results[index].bahasa,
                                              controller.results[index].bebasan,
                                              controller.results[index].english,
                                              controller.results[index].abjad
                                            ]);
                                          },
                                          title: Text(
                                              controller.results[index].bahasa,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: Get.height / 40)),
                                          subtitle: Text(
                                              controller.results[index].bebasan,
                                              style: GoogleFonts.roboto(
                                                  fontSize: Get.height / 50)),
                                          leading: Text(
                                              controller.results[index].abjad
                                                  .toUpperCase(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: Get.height / 55)),
                                          trailing: Text(
                                              controller.results[index].english,
                                              style: GoogleFonts.roboto(
                                                  fontSize: Get.height / 55)),
                                        ),
                                        Divider(
                                            thickness: 3,
                                            color: Colors.grey[300])
                                      ],
                                    )
                                  : controller.results[index].bahasa.contains(
                                              controller.searchWord) ||
                                          controller.results[index].bebasan
                                              .contains(
                                                  controller.searchWord) ||
                                          controller.results[index].english
                                              .contains(controller.searchWord)
                                      ? Column(children: [
                                          ListTile(
                                            onTap: () {
                                              Get.toNamed("/detail",
                                                  arguments: [
                                                    controller
                                                        .results[index].bahasa,
                                                    controller
                                                        .results[index].bebasan,
                                                    controller
                                                        .results[index].english,
                                                    controller
                                                        .results[index].abjad
                                                  ]);
                                            },
                                            title: Text(
                                                controller
                                                    .results[index].bahasa,
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: Get.height / 40)),
                                            subtitle: Text(
                                                controller
                                                    .results[index].bebasan,
                                                style: GoogleFonts.roboto(
                                                    fontSize: Get.height / 50)),
                                            leading: Text(
                                                controller.results[index].abjad
                                                    .toUpperCase(),
                                                style: GoogleFonts.roboto(
                                                    fontSize: Get.height / 55)),
                                            trailing: Text(
                                                controller
                                                    .results[index].english,
                                                style: GoogleFonts.roboto(
                                                    fontSize: Get.height / 55)),
                                          ),
                                          Divider(
                                              thickness: 3,
                                              color: Colors.grey[300])
                                        ])
                                      : const SizedBox();
                        });
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(Get.height / 50,
                        Get.height / 70, Get.height / 50, Get.height / 50),
                    width: Get.width / 30,
                    height: Get.height / 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Penanda",
                    style: GoogleFonts.roboto(fontSize: Get.height / 40),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    Get.height / 70, 0, Get.height / 70, Get.height / 70),
                height: Get.height / 5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Get.height / 40),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          color: Colors.grey)
                    ]),
              )
            ],
          ),
        ));
  }
}
