import 'package:applivrosbloc/data/repository/repository.dart';
import 'package:applivrosbloc/models/Results.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState>{

  final Repository repository;

  HomePageBloc({
    @required this.repository
  }) : assert (repository !=null);

  HomePageState _state = HomePageState.initial();
  @override
  // TODO: implement initialState
  HomePageState get initialState => HomePageState.initial(); //retornando primeiro estado

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    // TODO: implement mapEventToState
    if(event is HomePageEventSearch){
      _state = _state.copy(category: event.category, books: Result.loading());

      yield _state;
      var query = event.category;

      var booksResult = await repository.getBooks(query);
      _state = _state.copy(books: booksResult);
      yield _state;
    }
  }

}