import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var urlProvided = true;
var id = 1;
urlSetting() {
  urlProvided
      ? 'https://jsonplaceholder.typicode.com/albums/'
      : 'https://jsonplaceholder.typicode.com/albums/1';
}

class Albums {
  int? userId;
  int? id;
  String? title;

  Albums({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Albums.fromJson(Map<String, dynamic> myJsonMap) {
    return Albums(
      userId: myJsonMap['userId'],
      id: myJsonMap['id'],
      title: myJsonMap['title'],
    );
  }
}

Future<List<Albums>> viewSpecificData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
  if (response.statusCode == 200) {
    List myAlbum = jsonDecode(response.body);
    return myAlbum.map((e) => Albums.fromJson(e)).toList();
  } else {
    throw Exception('unexpected error occured');
  }
}

class ViewParticularData extends StatefulWidget {
  const ViewParticularData({super.key});

  @override
  State<ViewParticularData> createState() => _ViewParticularDataState();
}

class _ViewParticularDataState extends State<ViewParticularData> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Particular Data'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Id To View Data',
                  ),
                  controller: myController,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Data'),
                ),
                FutureBuilder<List<Albums>>(
                    future: viewSpecificData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Albums> myAlbumData = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                              itemCount: myAlbumData.length,
                              itemBuilder: (context, index) {
                                return Text('${myAlbumData[index].title}');
                              }),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
