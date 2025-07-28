import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/manual.dart';
import 'submenu_screen.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Menu>> loadMenus() async {
    String data = await rootBundle.loadString('assets/manual.json');
    List jsonResult = json.decode(data);
    return jsonResult.map((item) => Menu.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메뉴얼")),
      body: FutureBuilder<List<Menu>>(
        future: loadMenus(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final menus = snapshot.data!;
          return ListView.builder(
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(menus[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SubMenuScreen(menu: menus[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

