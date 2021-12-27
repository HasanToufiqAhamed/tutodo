import 'package:flutter/material.dart';
import 'package:tutodo/database/DBHelper.dart';
import 'package:tutodo/model/tasks.dart';

class OfflineCartProvider with ChangeNotifier {

  List<Tasks> _shoppingCart = [];

  List<Tasks> get cart => _shoppingCart;

  int _count=0;
  int get count => _count;

  var dbHelper = DBHelper();

  getAllProduct() {
    Future<List<Tasks>>? offlineTasks;
    offlineTasks = dbHelper.getCart();
    lists(offlineTasks);
  }

  lists(Future<List<Tasks>>? employees) async {
    _shoppingCart.clear();
    _shoppingCart=[];
    List<Tasks> em = await employees!;
    int cnt=0;
    if (em.length != 0) {
      for (int a = 0; a != em.length; a++) {
        _shoppingCart.add(em[a]);
        // cnt=cnt+em[a].quantity!;
      }
    }
    _count=cnt;
    notifyListeners();
  }
}