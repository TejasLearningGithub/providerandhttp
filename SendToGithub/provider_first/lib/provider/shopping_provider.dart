import 'package:flutter/cupertino.dart';

class ShoppingProvider with ChangeNotifier {
  List<String> _shoppingItems = [
    'Apple',
    'Banana',
    'Mango',
    'Kiwi',
  ];
  //List<String> myListOfItems = [];
  int get count => _shoppingItems.length;
  List<String> get myShoppingItems => _shoppingItems;

  void addMyItems(String item) {
    myShoppingItems.add(item);
    //myShoppingItems.add(item);
    print('====={$myShoppingItems}');

    notifyListeners();
  }

  int? myIncrement() {
    int myCount = count;
    print('$myCount');
    return myCount;
    notifyListeners();
  }
}
