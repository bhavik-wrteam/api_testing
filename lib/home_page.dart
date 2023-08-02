import 'dart:convert';


import 'package:api_testing/Data_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModelClass> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text(
            "Fetching APIs Data",
          ))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    color: CupertinoColors.systemOrange,
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "user_id: ${dataList[index].userId}",
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "id: ${dataList[index].id}",
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "title: ${dataList[index].title}",
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "body:${dataList[index].body}",
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<DataModelClass>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    print("my response = $response");

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        dataList.add(DataModelClass.fromJson(index));
      }
      return dataList;
    } else {
      return dataList;
    }
  }
}
