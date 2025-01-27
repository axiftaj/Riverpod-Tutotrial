import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/items.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});


class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  // Create
  void addItem(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
     state.add(newItem);
    state = state.toList();
  }

  // Read (state is already exposed as `state`)

  // Update
  void updateItem(String id, String newName) {

    int foundIndex = state.indexWhere((element) =>  element.id == id) ;
    state[foundIndex].name = newName;
    state = state.toList();

  }

  // Delete
  void deleteItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }
}


class ItemState {

}