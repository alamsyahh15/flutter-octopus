import 'package:flutter/material.dart';
import 'package:one_flutter_octopus/ui_view/main_list.dart';
import 'package:one_flutter_octopus/ui_view/main_slider.dart';

void main() => runApp(MaterialApp(
      home: PageHome(),
      title: 'Flutter Octopus',
      theme: ThemeData(
        primaryColor: Color(0xFFf3f5f7),
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFf3f5f7),
      ),
    ));

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[

            /** List Slider Home **/
            Container(
              height: 300,
              child: MainSlider(),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 24, bottom: 16),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),


                /** Tag Popular **/

                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    "POPULAR",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),


                /** Item Main List **/

                Padding(
                  padding: EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: MainList(),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
