import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfUsers extends StatefulWidget {
  const ListOfUsers({super.key});

  @override
  State<ListOfUsers> createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  String? name;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Users'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search), hintText: 'Search....'),
            onChanged: (val) {
              setState(() {
                name = val;
                print('====TextBox with $name====');
                searchData(name!);
              });
            },
            onTap: () {
              // Expanded(
              //   child: searchData(name!),
              // );
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: collectionReference.snapshots(),
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myUsers = snapshot.data!.docs[index];
                      return Text(myUsers['userName']);
                      //return Text('');
                    },
                  );
                }
                return Text('Fetching data');
              }),
            ),
          ),
        ],
      ),
    );
  }
}

searchData(String? name) {
  return StreamBuilder<QuerySnapshot>(
    stream: (name != "" && name != null)
        ? FirebaseFirestore.instance
            .collection('users')
            .where('userName', arrayContains: name)
            .snapshots()
        : FirebaseFirestore.instance.collection("users").snapshots(),
    builder: (context, snapshot) {
      return (snapshot.connectionState == ConnectionState.waiting)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Text(
                        data['userName'] ? 'Found' : 'Not Found',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(name!),
                    ],
                  ),
                );
              },
            );
    },
  );
}
