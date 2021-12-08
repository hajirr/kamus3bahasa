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
            style: GoogleFonts.buda(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              const Spacer(),
              Divider(
                thickness: 4,
                color: Colors.grey[200],
              ),
              SizedBox(
                height: Get.height / 1.5,
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    return ListView.builder(
                        itemCount: controller.results.length,
                        itemBuilder: (context, index) {
                          return controller.isLoading
                              ? const CircularProgressIndicator()
                              : ListTile(
                                  title: Text(controller.results[index].bahasa,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black)),
                                  subtitle: Text(
                                      controller.results[index].bebasan,
                                      style: GoogleFonts.roboto()),
                                  leading: Text(
                                      controller.results[index].abjad
                                          .toUpperCase(),
                                      style: GoogleFonts.roboto()),
                                  trailing:
                                      Text(controller.results[index].english),
                                );
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
