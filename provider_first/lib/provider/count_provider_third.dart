import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void countIncrement() {
    _count = _count + 1;
    notifyListeners();
  }
}
