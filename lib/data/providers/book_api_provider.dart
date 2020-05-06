import 'package:applivrosbloc/blocs/home_page_bloc/home_page_state.dart';
import 'package:applivrosbloc/models/Results.dart';
import 'package:applivrosbloc/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiProvider{
  final String baseUrlSearch = "https://www.googleapis.com/books/v1/volumes?q=";

  Future<Result<List<Book>, String>> getBooks(String query) async {
    final String url = "$baseUrlSearch$query";
    print(url);
    try{
      var response = await http.get(url);

      if(response.statusCode == 200){
        var body = response.body;
        var json = convert.jsonDecode(body);
        var data = BooksApiModel.fromJson(json);
        var books = data.items;

        print(response.statusCode.toString());
        return Result.success(books);
      }else{
        print(response.statusCode.toString());
        return Result.error("Erro ao carregar dados");
      }

    }catch(e){
      print(e.toString());
      return Result.error("Erro ao carregar dados");
    }
  }
}