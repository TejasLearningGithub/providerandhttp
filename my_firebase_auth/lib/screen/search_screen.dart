import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_firebase_auth/services/database_methods.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   var searchEditingController = TextEditingController();
//   var dataMethods = DatabaseMethods();
//   QuerySnapshot? searchSnapshot;
//   bool isLoading = false;
//   bool haveUserSearched = false;

//   initiateSearch() async {
//     if (searchEditingController.text.isNotEmpty) {
//       setState(() {
//         isLoading = true;
//       });
//       await dataMethods
//           .searchByName(searchEditingController.text)
//           .then((snapshot) {
//         searchSnapshot = snapshot;
//         print(searchSnapshot);
//         setState(() {
//           isLoading = false;
//           haveUserSearched = true;
//           print('=======Data Found=======');
//         });
//       });
//     }
//   }

//   Widget userList() {
//     return haveUserSearched
//         ? ListView.builder(
//             shrinkWrap: true,
//             // itemCount: searchSnapshot!.docs.length,
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               // return userTile(
//               //   searchSnapshot!.docs[index].data["userName"],
//               //   searchSnapshot!.docs[index].data["userEmail"],

//               // 't903040@gmail.com',
//               // 'tejas');
//               return ListTile(
//                 title: Text('Record found'),
//               );
//             })
//         : Container(
//             child: Text('User Not Found'),
//           );
//   }

//   Widget userTile(String userName, String userEmail) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 userName,
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               Text(
//                 userEmail,
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               )
//             ],
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () {
//               //sendMessage(userName);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(24)),
//               child: Text(
//                 "Message",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Search List'),
//       ),
//       body: isLoading
//           ? Container(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : Container(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     color: Color(0x54FFFFFF),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: searchEditingController,
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                             decoration: InputDecoration(
//                                 hintText: "search username ...",
//                                 hintStyle: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                                 border: InputBorder.none),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             initiateSearch();
//                           },
//                           child: Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       colors: [
//                                         const Color(0x36FFFFFF),
//                                         const Color(0x0FFFFFFF)
//                                       ],
//                                       begin: FractionalOffset.topLeft,
//                                       end: FractionalOffset.bottomRight),
//                                   borderRadius: BorderRadius.circular(40)),
//                               padding: EdgeInsets.all(12),
//                               child: Image.asset(
//                                 "assets/images/search_white.png",
//                                 height: 25,
//                                 width: 25,
//                               )),
//                         )
//                       ],
//                     ),
//                   ),
//                   userList()
//                 ],
//               ),
//             ),
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     //initiateSearch();
//     super.initState();
//   }
// }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
