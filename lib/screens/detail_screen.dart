import 'package:flutter/material.dart';
import '../models/manual.dart';

class DetailScreen extends StatelessWidget {
  final SubMenu item;
  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/${item.image}"),
            SizedBox(height: 20),
            Text(item.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

