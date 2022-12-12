import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_first/model/item_model.dart';


class ItemNotifierProvider with ChangeNotifier {
  List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  get size => _items.length;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void toggelItem(Item item) {
    item.toggle();
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}
