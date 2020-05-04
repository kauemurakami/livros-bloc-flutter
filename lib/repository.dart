import 'package:applivrosbloc/screens/android/home/bloc/home_page_state.dart';
import 'package:http/http.dart' as http;

class Repository{

  Future<HomePageState> getBooks(String query){
    return Future.delayed(Duration(seconds: 3),
        () =>  HomePageStateError(message: "Erro ao recuperar livros")
        );
  }
}