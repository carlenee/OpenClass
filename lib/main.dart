import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merrymas/app_color.dart';
import 'package:merrymas/models/scrap_journey.dart';
import 'package:merrymas/pages/login.dart';
import 'package:merrymas/pages/scrap_book.dart';
import 'package:merrymas/widgets/top_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(children: <Widget>[
          TopContainer(
            height: 350,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Profile",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 90,
                            backgroundImage: AssetImage(
                              'assets/images/me.jpg',
                            ),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Carlene Annabel',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text('NPM 2106752211',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ))
                        ]),
                  )
                ]),
          ),
          SizedBox(
            height: 40.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 4, bottom: 4, left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD668),
                      border: Border(
                          left:
                              BorderSide(width: 10, color: Color(0xFF5038BC)))),
                  child: Text("Bio",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22))),
              SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                      "Anak fasilkom yang lebih suka matematika daripada ngoding",
                      style: TextStyle(fontSize: 18))),
              SizedBox(height: 16),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 4, bottom: 4, left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD668),
                      border: Border(
                          left:
                              BorderSide(width: 10, color: Color(0xFF5038BC)))),
                  child: Text("Motivasi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22))),
              SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                      "Motivasi saya adalah agar bisa menghasilkan uang sedini mungkin",
                      style: TextStyle(fontSize: 18))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScrapBookPage()));
                  },
                  child: Text('Scrap Book'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kuning,
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.ungu,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
