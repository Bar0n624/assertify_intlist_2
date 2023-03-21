import 'dart:collection';
import 'package:flutter/foundation.dart';

class ItemData with ChangeNotifier {
  List<int> _items = [];
  UnmodifiableListView<int> get items => UnmodifiableListView(_items);
  get size => _items.length;
  void addItem(int item) {
    _items.add(item);
    notifyListeners();
  }
  void removeItem(int item) {
    _items.remove(_items[item]);
    notifyListeners();
  }
}