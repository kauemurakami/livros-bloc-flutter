import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {

  String imageUrl= "https://images.unsplash.com/photo-1542936221-b02434e3d36e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=653&q=80";
  String author;
  String title;
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
                  imageUrl,
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
                  Text("Titulo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black
                    ),
                  ),
                  Text("Autor",
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
