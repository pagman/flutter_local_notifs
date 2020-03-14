import 'package:flutter/material.dart';
import 'Item.dart';

class ItemAddNotifier extends ChangeNotifier {
  //
  List<Item> itemList = [];

  addItem(String itemName) async {
    Item item = Item(itemName);
    itemList.add(item);

    notifyListeners();
  }
}
