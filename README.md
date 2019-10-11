# flutter_todos

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

- [이 사이트 설명 참조함](https://felangel.github.io/bloc/#/gettingstarted)


For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# bloc 정리
-  TodosLoading 시에 화면에서 이벤트로 발생으로 데이터 로딩함. (???)

-  아래 형태로 사용함 
    body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
        if (state is TodosLoaded) {


   
### https://jsonplaceholder.typicode.com/posts?_start=0&_limit=15 : 리스트 요청 15

