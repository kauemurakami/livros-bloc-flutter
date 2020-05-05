import 'package:applivrosbloc/models/book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HomePageState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HomePageStateLoading extends HomePageState{
  @override
  String toString() => "HomePageStateLoading";
}

class HomePageStateSuccess extends HomePageState {
  List<Book> books;
  HomePageStateSuccess({@required this.books});

  @override
  String toString() => "HomePageStateSuccess";
}

class HomePageStateError extends HomePageState{
  final String message;

  HomePageStateError({@required this.message});

  @override
  String toString() => "HomePageStateError";

}
