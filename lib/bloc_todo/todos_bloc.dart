import 'dart:async';
import 'package:bloc/bloc.dart';

import './todos_event.dart';
import './todos_state.dart';

import './todo.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


class TodosBloc extends Bloc<TodosEvent, TodosState> {
/*
  TodosBloc()
  {
  }
*/
  @override
  TodosState get initialState => TodosLoading();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    }

/*      
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(currentState, event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(currentState, event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(currentState, event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState(currentState);
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState(currentState);
    }
*/    
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    try {
      
      final todos = await _fetchPosts(0, 15);
      yield TodosLoaded(
        todos,
      );

      /*
      final List<Todo> todos = List.generate(
        20, (i) => Todo('Todo $i', 'A description of what needs to be done for Todo $i', note: 'Todo $i'));
      yield TodosLoaded(
        todos,
      );
      */
      
      /*      
        final todos = await this.todosRepository.loadTodos();
      yield TodosLoaded(
        todos.map(Todo.fromEntity).toList(),
      );
      */
            
    } catch (_) {
      yield TodosNotLoaded();
    }
  }

 Future<List<Todo>> _fetchPosts(int startIndex, int limit) async {
    final response = await http.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Todo(rawPost['userId'].toString(), rawPost['id'].toString(), note: rawPost['title']);
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
/*
  Stream<TodosState> _mapAddTodoToState(
    TodosState currentState,
    AddTodo event,
  ) async* {
    if (currentState is TodosLoaded) {
      final List<Todo> updatedTodos = List.from(currentState.todos)
        ..add(event.todo);
      yield TodosLoaded(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<TodosState> _mapUpdateTodoToState(
    TodosState currentState,
    UpdateTodo event,
  ) async* {
    if (currentState is TodosLoaded) {
      final List<Todo> updatedTodos = currentState.todos.map((todo) {
        return todo.id == event.updatedTodo.id ? event.updatedTodo : todo;
      }).toList();
      yield TodosLoaded(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<TodosState> _mapDeleteTodoToState(
    TodosState currentState,
    DeleteTodo event,
  ) async* {
    if (currentState is TodosLoaded) {
      final updatedTodos =
          currentState.todos.where((todo) => todo.id != event.todo.id).toList();
      yield TodosLoaded(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<TodosState> _mapToggleAllToState(TodosState currentState) async* {
    if (currentState is TodosLoaded) {
      final allComplete = currentState.todos.every((todo) => todo.complete);
      final List<Todo> updatedTodos = currentState.todos
          .map((todo) => todo.copyWith(complete: !allComplete))
          .toList();
      yield TodosLoaded(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<TodosState> _mapClearCompletedToState(TodosState currentState) async* {
    if (currentState is TodosLoaded) {
      final List<Todo> updatedTodos =
          currentState.todos.where((todo) => !todo.complete).toList();
      yield TodosLoaded(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Future _saveTodos(List<Todo> todos) {
    return todosRepository.saveTodos(
      todos.map((todo) => todo.toEntity()).toList(),
    );
  }
*/  
}
