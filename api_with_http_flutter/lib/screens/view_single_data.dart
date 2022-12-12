import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Album {
  int? id;
  int? userId;
  String? title;

  Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> myJson) {
    return Album(
      id: myJson['id'],
      userId: myJson['userId'],
      title: myJson['title'],
    );
  }
}

var albumId = 5;
Future<Album> mySingleData() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$albumId'));
  if (response.statusCode == 200) {
    Album mySingleAlbum = Album.fromJson(jsonDecode(response.body));
    return mySingleAlbum;
  } else {
    throw Exception('unexpected error occured');
  }
}

class ViewSingleData extends StatefulWidget {
  const ViewSingleData({super.key});

  @override
  State<ViewSingleData> createState() => _ViewSingleDataState();
}

class _ViewSingleDataState extends State<ViewSingleData> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('view single data'),
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
                  onPressed: () {
                    setState(() {
                      albumId = int.parse(myController.text);
                    });
                  },
                  child: Text('View Data'),
                ),
                FutureBuilder<Album>(
                    future: mySingleData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Album myAlbumData = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Text('${snapshot.data!.title}');
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
