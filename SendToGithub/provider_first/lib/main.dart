import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/auth_provider.dart';
import 'package:provider_first/provider/count_provider_third.dart';
import 'package:provider_first/provider/counter_provider.dart';
import 'package:provider_first/provider/favourite_provider.dart';
import 'package:provider_first/provider/item_data_notifier.dart';
import 'package:provider_first/provider/shopping_provider.dart';
import 'package:provider_first/screen/favourite_item_screen.dart';
import 'package:provider_first/screen/favourite_screen.dart';
import 'package:provider_first/screen/first_page.dart';
import 'package:provider_first/screen/my_increment.dart';
import 'package:provider_first/screen/notify_listener_screen.dart';
import 'package:provider_first/screen/notify_listener_second.dart';
import 'package:provider_first/screen/second_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => ShoppingProvider()),
    ChangeNotifierProvider(create: (_) => ItemNotifierProvider()),
    ChangeNotifierProvider(create: (_) => CountProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => FavouriteProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // routes: {
      //   '/': (context) => MyFirstPage(),
      //   '/second': (context) => MySecondPage(),
      //   '/item': (context) => MyItemList()
      // },
      home: MyFirstPage(),
    );
  }
}
