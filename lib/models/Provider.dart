import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'item.dart';


class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;  // 파이어 스토어에 있는 컬렉션에 대한 객체
  List<Item> items = [];

  ItemProvider({reference}) {
    itemsReference = reference ?? FirebaseFirestore.instance.collection('items');   // reference 아니면 파이어 스토어에 있는 items 컬렉션을 가져오도록 초기화
  }

  Future<void> fetchItems() async {
    items = await itemsReference.get().then( (QuerySnapshot results) {
      return results.docs.map( (DocumentSnapshot document) {
        return Item.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}