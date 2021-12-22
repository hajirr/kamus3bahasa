import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.7, Get.height * 0.05)),
                child: const Text("Contoh Kalimat")),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.7, Get.height * 0.05)),
                child: const Text("Penanda"))
          ]),
        ),
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
                padding: EdgeInsets.only(bottom: Get.height * 0.03),
                width: Get.width,
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Get.height * 0.03),
                        bottomRight: Radius.circular(Get.height * 0.03))),
                child: Center(
                  child: Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.08,
                    padding: EdgeInsets.only(left: Get.height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.05)),
                    child: Center(
                      child: TextField(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.searchWord = '';
                              controller.update();
                            }
                          },
                          style:
                              GoogleFonts.roboto(fontSize: Get.height * 0.03),
                          controller: controller.searchWordController,
                          decoration: InputDecoration(
                              hintText: "Cari Kata",
                              hintStyle: GoogleFonts.roboto(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isLoading = true;
                                    controller.searchWord =
                                        controller.searchWordController.text;
                                    controller.isLoading = false;
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                  )),
                              border: InputBorder.none)),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Get.height * 0.02),
                          width: Get.width * 0.02,
                          height: Get.height * 0.02,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Bank kata",
                          style:
                              GoogleFonts.roboto(fontSize: Get.height * 0.02),
                        ),
                      ],
                    ),
                    Container(
                      height: Get.height * 0.65,
                      margin: EdgeInsets.only(top: Get.height * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.circular(Get.height * 0.03),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                color: Colors.grey)
                          ]),
                      child: GetBuilder<HomeController>(
                        builder: (_) {
                          return Scrollbar(
                            child: SmartRefresher(
                              controller: controller.scrollController,
                              enablePullDown: true,
                              enablePullUp: true,
                              onRefresh: controller.refreshData,
                              footer: CustomFooter(
                                builder: (context, mode) {
                                  if (mode == LoadStatus.idle) {
                                    return const Center(
                                        child: Text("pull up load"));
                                  } else if (mode == LoadStatus.loading) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else if (mode == LoadStatus.failed) {
                                    return const Center(
                                        child:
                                            Text("Load Failed!Click retry!"));
                                  } else if (mode == LoadStatus.canLoading) {
                                    return const Center(
                                        child: Text("release to load more"));
                                  } else {
                                    return const Center(
                                        child: Text("No more Data"));
                                  }
                                },
                              ),
                              onLoading: controller.loadData,
                              child: ListView.builder(
                                  itemCount: controller.results.length,
                                  itemBuilder: (context, index) {
                                    return controller.isLoading
                                        ? const CircularProgressIndicator()
                                        : controller.searchWord.isEmpty
                                            ? Column(
                                                children: [
                                                  controller.results[index]
                                                              .abjad
                                                              .toLowerCase() ==
                                                          controller
                                                              .results[index]
                                                              .bahasa[0]
                                                      ? ListTile(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                "/detail",
                                                                arguments: [
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .bahasa,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .bebasan,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .english,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .abjad
                                                                ]);
                                                          },
                                                          title: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .bahasa,
                                                              style: GoogleFonts.roboto(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.022)),
                                                          subtitle: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .bebasan,
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.018)),
                                                          leading: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .abjad
                                                                  .toUpperCase(),
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.022)),
                                                          trailing: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .english,
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.018)),
                                                        )
                                                      : ListTile(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                "/detail",
                                                                arguments: [
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .bahasa,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .bebasan,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .english,
                                                                  controller
                                                                      .results[
                                                                          index]
                                                                      .abjad
                                                                ]);
                                                          },
                                                          title: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .bahasa,
                                                              style: GoogleFonts.roboto(
                                                                  color: Colors
                                                                      .red[200],
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.022)),
                                                          subtitle: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .bebasan,
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.018)),
                                                          leading: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .abjad
                                                                  .toUpperCase(),
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.022)),
                                                          trailing: Text(
                                                              controller
                                                                  .results[
                                                                      index]
                                                                  .english,
                                                              style: GoogleFonts.roboto(
                                                                  fontSize: Get
                                                                          .height *
                                                                      0.018)),
                                                        ),
                                                  Divider(
                                                      thickness: 3,
                                                      color: Colors.grey[300])
                                                ],
                                              )
                                            : controller.results[index].bahasa
                                                        .contains(controller
                                                            .searchWord) ||
                                                    controller
                                                        .results[index].bebasan
                                                        .contains(controller
                                                            .searchWord) ||
                                                    controller
                                                        .results[index].english
                                                        .contains(controller
                                                            .searchWord)
                                                ? Column(children: [
                                                    controller.results[index]
                                                                .abjad
                                                                .toLowerCase() ==
                                                            controller
                                                                .results[index]
                                                                .bahasa[0]
                                                        ? ListTile(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  "/detail",
                                                                  arguments: [
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .bahasa,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .bebasan,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .english,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .abjad
                                                                  ]);
                                                            },
                                                            title: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .bahasa,
                                                                style: GoogleFonts.roboto(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.022)),
                                                            subtitle: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .bebasan,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.018)),
                                                            leading: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .abjad
                                                                    .toUpperCase(),
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.022)),
                                                            trailing: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .english,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.018)),
                                                          )
                                                        : ListTile(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  "/detail",
                                                                  arguments: [
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .bahasa,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .bebasan,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .english,
                                                                    controller
                                                                        .results[
                                                                            index]
                                                                        .abjad
                                                                  ]);
                                                            },
                                                            title: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .bahasa,
                                                                style: GoogleFonts.roboto(
                                                                    color: Colors
                                                                            .red[
                                                                        200],
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.022)),
                                                            subtitle: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .bebasan,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.018)),
                                                            leading: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .abjad
                                                                    .toUpperCase(),
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.022)),
                                                            trailing: Text(
                                                                controller
                                                                    .results[
                                                                        index]
                                                                    .english,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize: Get
                                                                            .height *
                                                                        0.018)),
                                                          ),
                                                    Divider(
                                                        thickness: 3,
                                                        color: Colors.grey[300])
                                                  ])
                                                : const SizedBox();
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                  ]))
            ],
          ),
        ));
  }
}
