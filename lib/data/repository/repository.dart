import 'package:applivrosbloc/data/providers/book_api_provider.dart';
import 'package:applivrosbloc/models/Results.dart';
import 'package:applivrosbloc/models/book.dart';

class Repository{

  final ApiProvider _appApiProvider;

  Repository(this._appApiProvider) : assert(_appApiProvider != null);

  Future<Result<List<Book>, String>> getBooks(String query) async{
    return _appApiProvider.getBooks(query);
  }


}