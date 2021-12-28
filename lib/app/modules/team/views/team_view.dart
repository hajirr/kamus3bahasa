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
      child: Column(children: [
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
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            width: Get.width,
            height: Get.height * 0.85,
            child: ListView(
              children: [
                Text(
                  "Penyusun",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: Get.height * 0.03),
                ),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.only(top: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Ahdi Zukfruf Amri, M.Pd",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.only(top: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Hj. Entik Atikoh, M.Si",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.only(top: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Saiful Maksoni, S.Pd",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.only(top: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Khoirul Aam, S.Pd",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Bahroni",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Text(
                  "Pembuat Aplikasi",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: Get.height * 0.03),
                ),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.only(top: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "bco.co.id (Muhajir)",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.03)),
                    child: Center(
                      child: Text(
                        "Asiatul Jannah Albantani Foundation",
                        style: GoogleFonts.poppins(
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ],
            ))
      ]),
    ));
  }
}
