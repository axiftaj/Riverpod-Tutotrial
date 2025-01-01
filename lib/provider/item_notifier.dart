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
    state = [...state, newItem];
  }

  // Read (state is already exposed as `state`)

  // Update
  void updateItem(String id, String newName) {
    state = state.map((item) {
      if (item.id == id) {
        return item.copyWith(name: newName);
      }
      return item;
    }).toList();
  }

  // Delete
  void deleteItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}
