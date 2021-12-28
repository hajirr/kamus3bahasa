import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/translate_controller.dart';

class TranslateView extends GetView<TranslateController> {
  const TranslateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                HexColor("#949CDF"),
                HexColor("#A7C5EB"),
                HexColor("#F6ECF0"),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: Get.height * 0.15,
                  padding: EdgeInsets.only(left: Get.width * 0.03),
                  child: Row(children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      "Kembali",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.02,
                          color: Colors.white),
                    )
                  ]),
                ),
              ),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.08,
                padding: EdgeInsets.only(left: Get.height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Get.height * 0.05)),
                child: Center(
                  child: TextField(
                      onChanged: (value) {
                        controller.searchWord =
                            controller.searchWordController.text;
                      },
                      style: GoogleFonts.roboto(fontSize: Get.height * 0.03),
                      controller: controller.searchWordController,
                      decoration: InputDecoration(
                          hintText: "Cari Kata",
                          hintStyle: GoogleFonts.roboto(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (controller
                                    .searchWordController.text.isNotEmpty) {
                                  controller.searchData();
                                }
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.blue,
                              )),
                          border: InputBorder.none)),
                ),
              ),
              Container(
                height: Get.height * 0.65,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: GetBuilder<TranslateController>(
                  builder: (_) {
                    return controller.isLoading
                        ? const CircularProgressIndicator()
                        : Scrollbar(
                            child: SmartRefresher(
                              controller: controller.scrollController,
                              enablePullDown: true,
                              enablePullUp: true,
                              onRefresh: controller.refreshData,
                              footer: CustomFooter(builder: (context, mode) {
                                return controller.searchCondition(mode);
                              }),
                              onLoading: controller.loadData,
                              child: ListView.builder(
                                  itemCount: controller.results.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: Get.height * 0.2,
                                        width: Get.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        margin:
                                            EdgeInsets.all(Get.height * 0.02),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                Get.height * 0.02)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GetBuilder<
                                                      TranslateController>(
                                                    builder: (_) {
                                                      return FavoriteButton(
                                                          isFavorite: false,
                                                          valueChanged:
                                                              (value) {
                                                            controller
                                                                .valueChanged(
                                                                    index,
                                                                    value);
                                                          });
                                                    },
                                                  ),
                                                  Text(
                                                    controller
                                                        .results[index].abjad,
                                                    style: GoogleFonts.roboto(
                                                        fontSize:
                                                            Get.height * 0.1,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: HexColor(
                                                            "#949CDF")),
                                                  ),
                                                ]),
                                            SizedBox(
                                              width: Get.width * 0.6,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      controller.results[index]
                                                          .bahasa,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: Get.height *
                                                              0.025,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      controller.results[index]
                                                          .bebasan,
                                                      textAlign: TextAlign.end,
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Get.height * 0.02,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                    Text(
                                                      controller.results[index]
                                                          .english,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: Get.height *
                                                              0.02),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ));
                                  }),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
