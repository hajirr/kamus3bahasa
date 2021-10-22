import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/controllers/controller.dart';
import 'package:kamus3bahasa/models/kamus.dart';

class SearchKamus extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    MyController myController = Get.find();
    return FutureBuilder<List<Kamus>>(
      future: myController.readJsonData(query),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                      fontSize: 20, color: Colors.deepPurple)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                      fontSize: 20, color: Colors.deepPurple)),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Cari kata"),
    );
  }
}
