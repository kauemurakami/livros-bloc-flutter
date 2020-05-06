import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HomePageEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HomePageEventSearch extends HomePageEvent{
  final String category;
  HomePageEventSearch({@required this.category});

  @override
  String toString() => "HomePageEventSearch";

}

