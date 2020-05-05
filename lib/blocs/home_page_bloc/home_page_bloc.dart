import 'package:applivrosbloc/data/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState>{

  final Repository repository;

  HomePageBloc({
    @required this.repository
});
  @override
  // TODO: implement initialState
  HomePageState get initialState => HomePageStateLoading(); //retornando primeiro estado

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
    // TODO: implement mapEventToState
    if(event is HomePageEventSearch){
      yield HomePageStateLoading();

      var query = event.query;
      var booksResult = await repository.getBooks(query);

      yield booksResult;
    }
  }

}