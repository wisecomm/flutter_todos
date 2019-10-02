import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/bloc_todo/todos_state.dart';
import './bloc_todo/todos_bloc.dart';
import './bloc_todo/todo.dart';

import './loading_indicator.dart';

import './bloc_todo/todos_event.dart';

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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    
    return BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          List<Todo> todos = List<Todo>();
        if (state is TodosLoaded) {
          todos = state.todos;
        } else if (state is TodosLoading) {
          todosBloc.dispatch(LoadTodos());
          return LoadingIndicator();
        } else {
          return Container();
        }


    return Scaffold(
        appBar: AppBar(
          title: Text('bloc todo first sample'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].note),
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
