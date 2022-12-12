import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/shopping_provider.dart';

class MySecondPage extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sCount = context.read<ShoppingProvider>().count;

    // print('$myList');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            for (var i = 0; i < sCount; i++)
              //   Text(
              //     myList[i],
              //   ),
              Text(context.watch<ShoppingProvider>().myShoppingItems[i]),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: textController,
              ),
            ),
            Text('${context.read<ShoppingProvider>().myIncrement()}'),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ShoppingProvider>()
                      .addMyItems(textController.text);
                },
                child: Text('Add Item')),
          ],
        ),
      ),
    );
  }
}
