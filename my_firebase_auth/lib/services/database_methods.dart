import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((error) {
      print(error.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userEmail', isEqualTo: email)
        .get()
        .catchError((error) {
      print(error.toString());
    });
  }

  searchByName(String searchField) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userName", isEqualTo: searchField)
        .get();
  }
}
