import 'package:flutter/material.dart';
import '../models/manual.dart';
import 'detail_screen.dart';

class SubMenuScreen extends StatelessWidget {
  final Menu menu;
  SubMenuScreen({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.title)),
      body: ListView.builder(
        itemCount: menu.subMenus.length,
        itemBuilder: (context, index) {
          final item = menu.subMenus[index];
          return ListTile(
            title: Text(item.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

