import 'menuitem.dart';

class MenuCategory {
  final String name;
  //final String description;
  final List<MenuItem> items;

  MenuCategory({
    required this.name,
    //required this.description,
    required this.items,
  });
}
