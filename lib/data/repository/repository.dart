import 'package:applivrosbloc/data/providers/app_api_provider.dart';
import 'package:applivrosbloc/models/book.dart';
import 'package:applivrosbloc/screens/android/home/bloc/home_page_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Repository{

  ApiProvider appApiProvider = ApiProvider();

  Future<HomePageState> getBooks(String query) => appApiProvider.getBooks(query);


}