import 'package:applivrosbloc/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:applivrosbloc/blocs/home_page_bloc/home_page_event.dart';
import 'package:applivrosbloc/blocs/home_page_bloc/home_page_state.dart';
import 'package:applivrosbloc/components/book_widget.dart';
import 'package:applivrosbloc/components/error_widget.dart';
import 'package:applivrosbloc/components/loading_widget.dart';
import 'package:applivrosbloc/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categorias = [
    "Programação",
    "Android",
    "Java",
    "História",
    "Ciências",
  ];

  int _selectedIndex = 0;
  HomePageBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = HomePageBloc(repository: Repository());
    SystemChrome.setEnabledSystemUIOverlays([]);
    _bloc.add(HomePageEventSearch(query: categorias[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 42),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    "Procurar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                Text(
                  "Recomendar",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categorias.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: GestureDetector(
                        child: Chip(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          backgroundColor: index == _selectedIndex
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          label: Text(
                            categorias.elementAt(index),
                            style: TextStyle(
                                color: index == _selectedIndex
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        onTap: () {
                          _selectedIndex = index;
                          setState(() {});
                        },
                      ),
                    );
                  }),
            ),
            BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                switch(state){
                  case HomePageStateLoading:
                    return LoadingWidget();
                    break;
                  case HomePageStateError:
                    return ErrorLoading();
                    break;
                  case HomePageStateSuccess:
                    final books = state.books;
                    return Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              return BookWidget();
                            }),
                      ),
                    );
                    break;
                }
                return ErrorLoading();
              },
            ),
          ],
        ),
      ),
    );
  }
}
