import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_first/provider/counter_provider.dart';
import 'package:provider_first/provider/shopping_provider.dart';

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Provider Example',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'You have pushed button this many times\n = ${context.watch<CounterProvider>().count},',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterProvider>().increment(),
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterProvider>().reset(),
            child: Icon(Icons.exposure_zero),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterProvider>().decrement(),
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
