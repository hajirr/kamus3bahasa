import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/team_controller.dart';

class TeamView extends GetView<TeamController> {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            HexColor("#949CDF"),
            HexColor("#A7C5EB"),
            HexColor("#F6ECF0"),
          ])),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      ]),
    ));
  }
}
