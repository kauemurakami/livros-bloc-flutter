import 'package:applivrosbloc/models/book.dart';
import 'package:applivrosbloc/screens/android/home/bloc/home_page_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiProvider{
  final String baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future<HomePageState> getBooks(String query) async{
    final String url = " $baseUrl?q=$query ";
    var response = await http.get(url);

    if(response.statusCode == 200){
      var body = response.body;
      var json = convert.jsonDecode(body);
      var data = BooksApiModel.fromJson(json);
      var books = data.items;
      return HomePageStateSuccess(
          books: books
      );
    }else{
      return HomePageStateError(message: response.statusCode.toString());
    }
  }
}