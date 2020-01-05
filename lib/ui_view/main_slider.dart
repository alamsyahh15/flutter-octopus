import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one_flutter_octopus/model/result_news.dart';
import 'package:one_flutter_octopus/network/network_provider.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  NetworkResponse networkResponse = NetworkProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: networkResponse.getNews(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new ItemSlider(list: snapshot.data)
            : new Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

// ignore: must_be_immutable
class ItemSlider extends StatelessWidget {
  List list;
  ItemSlider({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Article data = list[index];
          return Padding(
            padding: EdgeInsets.only(left: 16, right: 4, top: 16),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 300,
                width: 340,
                child: Column(
                  children: <Widget>[
                    // For Image
                    Container(
                      height: 200,
                      child: Image.network(
                        data.urlToImage,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),

                    //For Title
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 4, right: 4),
                      child: Column(
                        children: <Widget>[
                          Text(
                            data.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
