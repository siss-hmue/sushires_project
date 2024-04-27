import 'package:flutter/material.dart';
import 'CartPage.dart';
import 'CategoryPage.dart';
import 'cartitem.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuCategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menuCategories[index].name),
            //subtitle: Text(menuCategories[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryPage(menuCategory: menuCategories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
