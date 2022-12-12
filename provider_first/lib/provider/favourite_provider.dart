import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addFavouriteItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeFavouriteItem(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
