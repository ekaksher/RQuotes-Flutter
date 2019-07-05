import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
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
                        child: Text("Quote Title"),
                      ),
                    ),
                    Align(alignment: Alignment.centerRight,child: IconButton(padding: const EdgeInsets.only(top: 16.0),
                    icon: Icon(Icons.save_alt,color: Colors.white),onPressed: (){
                      print("you need to add function to quote to phone here...");
                    },),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
