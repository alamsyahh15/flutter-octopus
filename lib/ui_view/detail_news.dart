import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String title, content, image;

  DetailPage({this.title, this.content, this.image});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
