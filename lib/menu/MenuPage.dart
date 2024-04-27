import 'package:flutter/material.dart';
import 'package:sushires_project/components/appbackground.dart';
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
        backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: AppBackGround(
        childWidget: ListView.builder(
          itemCount: menuCategories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                menuCategories[index].name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
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
      ),
    );
  }
}
