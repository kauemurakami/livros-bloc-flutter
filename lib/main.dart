import 'package:applivrosbloc/blocs/home_page_bloc/home_page_state.dart';
import 'package:applivrosbloc/screens/android/home/home_page.dart';
import 'package:applivrosbloc/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home_page_bloc/home_page_bloc.dart';
import 'blocs/home_page_bloc/home_page_event.dart';
import 'data/providers/book_api_provider.dart';
import 'data/repository/repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomePageBloc _homePageBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    final _booksProvider = ApiProvider();
    final repository = Repository(_booksProvider);
    _homePageBloc = HomePageBloc(repository: repository);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (_) => _homePageBloc,
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Livros',
        theme: appThemeData,
        home: Home(),
      )
    );
  }
}
