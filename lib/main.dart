import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:html/parser.dart' as html;
import 'dart:core';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Quote To Ponder",
        theme: ThemeData(
            fontFamily: "Cinzel",
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _quote ;
  String _author;
  var _date;
  void getDate(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String date = formatter.format(now);
    setState(() {
      _date = date;
    });
  }
  Future<void> scrapeQuote() async{
    String url = 'http://quotes.toscrape.com/random';
    try{
      http.Response response = await http.get(url);
      final document = html.parse(response.body);
      final myQuote = document.querySelector("div.quote> span.text").innerHtml;
      final author =  document.querySelector("div.quote> span> small.author").innerHtml;
      setState(() {
        _quote = myQuote;
        _author = author;
      });
    }
    catch (e){}
  }
  @override
  void initState(){
    super.initState();
    scrapeQuote();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Quotes To Ponder"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("$_date", style: TextStyle(fontSize: 16.0),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        padding: const EdgeInsets.only(top: 10.0),
                        icon: Icon(Icons.save_alt, color: Colors.white),
                        onPressed: () {
                          print(
                              "you need to add function to quote to phone here...");
                        },
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: _quote != null
                        ? Text(
                            '$_quote',
                            style: TextStyle(fontSize: 34.0, height: 1.15,fontFamily: 'Cinzel'),
                          )
                        : CircularProgressIndicator(),
                  ),
                ),

                Text('~$_author') //<.start here...
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("function to open notepad ");
        },
        child: Icon(Icons.note_add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}
