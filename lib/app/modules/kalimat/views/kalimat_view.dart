import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/kalimat_controller.dart';

class KalimatView extends GetView<KalimatController> {
  const KalimatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Kamus 3 Bahasa',
            style: GoogleFonts.buda(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          color: Colors.blue,
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                          hintText: "Cari Kalimat",
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
              Expanded(
                child: Container(
                  height: Get.height * 0.65,
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Get.height * 0.04),
                          topRight: Radius.circular(Get.height * 0.04)),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 10,
                            color: Colors.grey)
                      ]),
                  child: GetBuilder<KalimatController>(
                    builder: (_) {
                      return controller.isLoading
                          ? const CircularProgressIndicator()
                          : Scrollbar(
                              child: SmartRefresher(
                                controller: controller.scrollController,
                                enablePullDown: true,
                                enablePullUp: true,
                                onRefresh: controller.refreshData,
                                footer: CustomFooter(
                                  builder: (context, mode) {
                                    if (mode == LoadStatus.idle) {
                                      return const Center(
                                          child: Text("Pull up load"));
                                    } else if (mode == LoadStatus.loading) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (mode == LoadStatus.failed) {
                                      return const Center(
                                          child: Text(
                                              "Load Failed! Click retry!"));
                                    } else if (mode == LoadStatus.canLoading) {
                                      return const Center(
                                          child: Text("Release to load more"));
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
                                      return Column(children: [
                                        ListTile(
                                          onTap: () {
                                            Get.toNamed("/detail", arguments: [
                                              controller.results[index].bahasa,
                                              controller.results[index].bebasan,
                                              controller.results[index].english,
                                            ]);
                                          },
                                          title: Text(
                                              controller.results[index].bahasa,
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize:
                                                      Get.height * 0.022)),
                                          subtitle: Text(
                                              controller.results[index].bebasan,
                                              style: GoogleFonts.roboto(
                                                  fontSize:
                                                      Get.height * 0.018)),
                                          trailing: Text(
                                              controller.results[index].english,
                                              style: GoogleFonts.roboto(
                                                  fontSize:
                                                      Get.height * 0.018)),
                                        )
                                      ]);
                                    }),
                              ),
                            );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
