import 'package:flutter/material.dart';

class ListTodoDetail extends StatelessWidget {
  // Declare a field that holds the Todo
  final String description;

  // In the constructor, require a Todo
  ListTodoDetail({Key key, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Todo List Detail';

    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(this.description),
      ),
    );
  }
}