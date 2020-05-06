import 'package:applivrosbloc/models/book.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {

  final Book book;
  VolumeInfo get _bookInfo => book.volumeInfo;

  BookWidget({Key key, @required this.book }) :
        assert(book != null), super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  _bookInfo.imageLinks.thumbnail,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(24),
              width: 220,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    blurRadius: 5
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(_bookInfo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black
                    ),
                  ),
                  Text(_bookInfo.authors[0],
                    style: TextStyle(
                        color: Colors.black54
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
