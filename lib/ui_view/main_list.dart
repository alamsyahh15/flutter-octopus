import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:one_flutter_octopus/model/result_news.dart';
import 'package:one_flutter_octopus/network/constant_file.dart';
import 'package:one_flutter_octopus/network/network_provider.dart';
import 'package:http/http.dart' as http;

import 'detail_news.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  NetworkResponse networkResponse = NetworkProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: networkResponse.getNews(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new SliderItem(list: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class SliderItem extends StatelessWidget {
  List list;
  SliderItem({this.list});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final Article data = list[index];
        return Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(
                title: data.title,
                content: data.content,
                image: data.urlToImage,
              )));

            },
            child: Card(
              elevation: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    // Item Image
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 100,
                              width: 150,
                              child: Image.network(
                                data.urlToImage,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                              height: 25,
                              child: RaisedButton(
                                child: Text(
                                  "Category",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                color: Color(0xFF0504AA),
                              ),
                            ),
                            Text(
                              data.source.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 1,
                            ),
                            Text(
                              data.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
