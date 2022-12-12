import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class Albums {
  int? id;
  int? userId;
  String? title;

  Albums({required this.id, required this.userId, required this.title});

  factory Albums.fromJson(Map<String, dynamic> myJson) {
    return Albums(
      id: myJson['id'],
      userId: myJson['userId'],
      title: myJson['title'],
    );
  }
}

Future<List<Albums>> retriveAlbumsData() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  );
  if (response.statusCode == 200) {
    List myList = jsonDecode(response.body);
    return myList.map((e) => Albums.fromJson(e)).toList();
  } else {
    throw Exception('unexpected error occured');
  }
}

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Available In Album'),
      ),
      body: FutureBuilder<List<Albums>>(
        future: retriveAlbumsData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Albums> myData = snapshot.data;
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myData[index].id.toString()),
                        Text(myData[index].userId.toString()),
                        Text(myData[index].title ?? '')
                      ],
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            print('${snapshot.error}');
          }
          return CircularProgressIndicator(
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
