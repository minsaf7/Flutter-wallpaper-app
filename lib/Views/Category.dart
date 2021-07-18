import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final categoryTitle;
  const Category({Key? key, this.categoryTitle}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),
    );
  }
}
