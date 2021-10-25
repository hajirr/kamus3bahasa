import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5), () => Get.off(() => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                "\"Utamakan Bahasa Indonesia, Lestarikan Bahasa Daerah Dan Kuasai Bahasa Asing.\"",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
