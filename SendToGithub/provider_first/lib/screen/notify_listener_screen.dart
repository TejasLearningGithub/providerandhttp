import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Use of Notify Listener'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Text(_counter.value.toString());
          },
          valueListenable: _counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
                _counter.value++,
                print(_counter.value.toString()),
              }),
    );
  }
}
