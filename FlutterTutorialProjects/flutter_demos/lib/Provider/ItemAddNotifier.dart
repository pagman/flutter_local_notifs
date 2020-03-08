import 'package:flutter/material.dart';
import 'Item.dart';

class ItemAddNotifier extends ChangeNotifier {
  //
  List<Item> itemList = [];

  addTask(String item) async {
    //
    Item itemModel = Item(item);
    itemList.add(itemModel);

    notifyListeners();
  }
}
