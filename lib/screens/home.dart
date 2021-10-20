import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kamus3bahasa/controllers/controller.dart';
import 'package:kamus3bahasa/models/kamus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.put(MyController());
    return Scaffold(
        body: FutureBuilder(
      future: controller.readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<Kamus>;
          return Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height / 2.7,
                padding: const EdgeInsets.all(8),
                color: Colors.orange,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: Get.width / 2,
                    ),
                    TextField(
                      controller: controller.cSearch,
                      decoration: const InputDecoration(
                        hintText: "Cari Kata",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.isEmpty ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: items[index].imbuhan == true
                            ? Colors.grey[200]
                            : Colors.white,
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(
                            items[index].imbuhan == true ? 25 : 10,
                            10,
                            items[index].imbuhan != true ? 25 : 10,
                            10),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Bahasa :",
                                      textAlign: items[index].imbuhan == true
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        "Jawa Banten :",
                                        textAlign: items[index].imbuhan == true
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    Text("Inggris :",
                                        textAlign: items[index].imbuhan == true
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.deepPurple)),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${items[index].bahasa}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        "${items[index].bebasan}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    Text("${items[index].english}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.deepPurple)),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
