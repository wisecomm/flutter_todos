import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/bloc_todo/todos_state.dart';
import './bloc_todo/todos_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: BlocProvider<TodosBloc>(
              builder: (context) => TodosBloc(),
              child: MyHomePage(title: 'Flutter Demo Home Page'),
            ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Todo> todos = List.generate(
    20, (i) => Todo('Todo $i', 'A description of what needs to be done for Todo $i'));


  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    
    return BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {

    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(
//                    builder: (context) => ListTodoDetail(description: todos[index].description),
                  ),
                );
              },
            );
          }
        ),
    );

        }
    );
  }
}
