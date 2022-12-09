import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';

class NotifierListenerSecond extends StatelessWidget {
  NotifierListenerSecond({super.key});
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Example'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                          print('${toggle.value}');
                        },
                        child: Icon(
                          toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
