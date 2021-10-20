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
    MyController myController = Get.put(MyController());
    return Scaffold(
        body: FutureBuilder(
      future: myController.readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<Kamus>;
          return ListView.builder(
              itemCount: items.isEmpty ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  color: items[index].imbuhan == true
                      ? Colors.yellow[300]
                      : Colors.green[300],
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
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: items[index].imbuhan == true
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bahasa: ${items[index].bahasa}",
                                textAlign: items[index].imbuhan == true
                                    ? TextAlign.right
                                    : TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Bebasan: ${items[index].bebasan}",
                                  textAlign: items[index].imbuhan == true
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                              Text("Inggris: ${items[index].english}",
                                  textAlign: items[index].imbuhan == true
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.deepPurple)),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
