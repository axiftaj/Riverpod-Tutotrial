

import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteProvider = StateNotifierProvider<FavouriteSateProvider, FavouriteState>((ref){
  return FavouriteSateProvider();
});


class FavouriteSateProvider extends StateNotifier<FavouriteState> {
  FavouriteSateProvider(): super(FavouriteState(allItems: [] , search: '', filteredItems: []));

  void addItem(){
     List<Item> item = [
       Item(name: 'MacBook' ,favourite: true , id: 1),
       Item(name: 'iPhone' ,favourite: false , id: 2),
       Item(name: 'G-force 3060' ,favourite: false , id: 3),
       Item(name: 'Samsung Ultra' ,favourite: true , id: 4),
       Item(name: 'Google Pixel 9' ,favourite: false , id: 5),
       Item(name: 'iPad Pro 13' ,favourite: true , id: 6)
     ];

     state = state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }


  void filterList(String search){
    state = state.copyWith(filteredItems:  _filterItems(state.allItems , search), search: search);
  }

  void favouriteItem(String option){
    state = state.copyWith(filteredItems:  _favouriteItem(state.allItems , option));
  }

  List<Item> _favouriteItem(List<Item> items, String option) {
    print(option);

    if(option == 'All'){
      return items ;
    }

    return items
        .where((item) =>
    item.favourite == true)
        .toList();
  }



  List<Item> _filterItems(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    }


    return items
        .where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
 


}

class FavouriteState  {
    final List<Item> allItems ;
    final List<Item> filteredItems ;
    final  String search ;
    FavouriteState({required this.allItems  , required this.search , required this.filteredItems});


    FavouriteState copyWith({
       List<Item>? allItems ,
        String? search ,
      List<Item>? filteredItems
    }){
      return FavouriteState(
          search:  search ?? this.search ,
          allItems:  allItems ?? this.allItems ,
          filteredItems :  filteredItems ?? this.filteredItems
      );
    }
}

class Item {
  final String name ;
  final int id ;
  final bool favourite ;

  Item({required this.name , required this.id, required this.favourite});

  Item copyWith({
    String? name,
    int? id,
    bool? favourite,
  }){
    return Item(
        name: name ??  this.name,
        id: id ?? this.id ,
        favourite: favourite ?? this.favourite
    );
}
}