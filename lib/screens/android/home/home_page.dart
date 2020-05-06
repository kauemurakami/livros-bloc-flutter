import 'package:applivrosbloc/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:applivrosbloc/blocs/home_page_bloc/home_page_event.dart';
import 'package:applivrosbloc/blocs/home_page_bloc/home_page_state.dart';
import 'package:applivrosbloc/components/book_widget.dart';
import 'package:applivrosbloc/components/error_widget.dart';
import 'package:applivrosbloc/components/loading_widget.dart';
import 'package:applivrosbloc/data/providers/book_api_provider.dart';
import 'package:applivrosbloc/data/repository/repository.dart';
import 'package:applivrosbloc/models/ResultStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {

  List<String> categorias = [
    "Android",
    "Programação",
    "Java",
    "História",
    "Ciências",
  ];


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
            BlocBuilder<HomePageBloc, HomePageState>(
                bloc: BlocProvider.of<HomePageBloc>(context),
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(top: 12),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categorias.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final category = categorias.elementAt(index);
                          final isSelectedCategory = category == state.category;
                          return Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: GestureDetector(
                              child: Chip(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                backgroundColor: isSelectedCategory
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                label: Text(
                                  category,
                                  style: TextStyle(
                                      color: isSelectedCategory
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                              onTap: () {
                                BlocProvider.of<HomePageBloc>(context)
                                    .add(HomePageEventSearch(category: category));
                              },
                            ),
                          );
                        }),
                  );
                }),
            BlocBuilder<HomePageBloc, HomePageState>(
              bloc: BlocProvider.of<HomePageBloc>(context),
              builder: (context, state) {
                print(state.books.status);

                if (state.books.status == ResultStatus.loading) {
                  return LoadingWidget();
                } else if (state.books.status == ResultStatus.success) {
                  final books = state.books.data;
                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final item = books.elementAt(index);
                            print(item);
                            return BookWidget(book: item);
                          }),
                    ),
                  );
                } else if (state.books.status == ResultStatus.failed) {
                  return ErrorLoading("Erro ao carregar livros");
                }
                return ErrorLoading(state.books.data.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
