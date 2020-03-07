import 'package:flutter/material.dart';
import 'Item.dart';

class ItemModel extends ChangeNotifier {
  //
  List<Item> taskList = [];

  addTask(String item) async {
    //
    Item itemModel = Item(item);
    taskList.add(itemModel);

    notifyListeners();
  }
}
