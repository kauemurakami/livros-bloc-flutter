import 'package:applivrosbloc/models/Results.dart';
import 'package:applivrosbloc/models/book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class HomePageState extends Equatable {

  final String category;
  final Result<List<Book>, String> books;

  HomePageState({
    @required this.books,
    @required this.category
  }) : super();

  @override
  // TODO: implement props
  List<Object> get props => null;

  factory HomePageState.initial() {
    return HomePageState(
        books: Result.idle(data: []),
        category: ""
    );
  }

  HomePageState copy({
    String category,
    Result<List<Book>, String> books}) {
    return HomePageState(
        category: category ?? this.category,
        books: books ?? this.books
    );
  }

}
