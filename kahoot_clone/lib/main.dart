import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xFF38AE9C),
        title: Row(
          children: <Widget> [
            IconButton (
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            Container(
              // TODO: Sửa thành padding center
              padding: EdgeInsets.all(70),
              child: Text(
                "Question 2/5",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // Page 05 - Question
        // child: Column(
        //   // Column is also a layout widget. It takes a list of children and
        //   // arranges them vertically. By default, it sizes itself to fit its
        //   // children horizontally, and tries to be as tall as its parent.
        //   //
        //   // Invoke "debug painting" (press "p" in the console, choose the
        //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //   // to see the wireframe for each widget.
        //   //
        //   // Column has various properties to control how it sizes itself and
        //   // how it positions its children. Here we use mainAxisAlignment to
        //   // center the children vertically; the main axis here is the vertical
        //   // axis because Columns are vertical (the cross axis would be
        //   // horizontal).
        //   children: <Widget>[
        //     Expanded(
        //       child: Container(
        //         width: double.infinity,
        //         height: double.infinity,
        //         color: Color(0xFF38AE9C),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Row (
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   // child: Text(
        //                   //   "Place holder question:",
        //                   //   textAlign: TextAlign.center,
        //                   //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF))
        //                   // ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(15.0),
        //                       child: Text(
        //                         "Place holder question:",
        //                         textAlign: TextAlign.center,
        //                         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF))
        //                       ),
        //                   )
        //                 ),
        //               ]
        //             ),
        //             Row (
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   child: Text(
        //                     "1 + 1 = ?",
        //                     textAlign: TextAlign.center,
        //                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF))
        //                   ),
        //                 ),
        //               ]
        //             )
        //           ],
        //         )
        //       ),
        //     ),
        //
        //     Expanded(
        //       child: Container(
        //         width: double.infinity,
        //         height: double.infinity,
        //         child:
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 300,
        //                     padding: EdgeInsets.all(8),
        //                     margin: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.circle,
        //                       border: Border.all(width: 3.0, color: Color(0xFF38AE9C)),
        //                       // borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                     ),
        //                     child: Text(
        //                       "23",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(fontSize: 18)
        //                     ),
        //                   ),
        //                 ]
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 300,
        //                     padding: EdgeInsets.all(8),
        //                     margin: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(
        //                       color: Color(0xFF38AE9C),
        //                       border: Border.all(width: 2.0, color: Color(0xFF38AE9C)),
        //                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                     ),
        //                     child: Text(
        //                       "2",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(fontSize: 18)
        //                     ),
        //                   ),
        //                 ]
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 300,
        //                     padding: EdgeInsets.all(8),
        //                     margin: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(
        //                       border: Border.all(width: 2.0, color: Color(0xFF38AE9C)),
        //                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                     ),
        //                     child: Text(
        //                       "3",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(fontSize: 18)
        //                     ),
        //                   ),
        //                 ]
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 300,
        //                     padding: EdgeInsets.all(8),
        //                     margin: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(
        //                       border: Border.all(width: 2.0, color: Color(0xFF38AE9C)),
        //                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                     ),
        //                     child: Text(
        //                       "4",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(fontSize: 18)
        //                     ),
        //                   ),
        //                 ]
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 300,
        //                     padding: EdgeInsets.all(8),
        //                     margin: EdgeInsets.all(8),
        //                     decoration: BoxDecoration(
        //                       color: Color(0xFFD04A4E),
        //                       border: Border.all(width: 2.0, color: Color(0xFFD04A4E)),
        //                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //                     ),
        //                     child: Text(
        //                       "45",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(fontSize: 18)
        //                     ),
        //                   ),
        //                 ]
        //               ),
        //             ],
        //           )
        //       ),
        //     ),
        //   ],
        // ),
        // Page 06 - Result
        child: Column(
          children: [
            Expanded (
              child: Container (
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFF38AE9C),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            "Happy Won!",
                            style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFffed69),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "SCORE BOARD",
                                      style: TextStyle(color: Color(0xFF38AE9C)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  // TODO: Sửa fixed width
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Username",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "1000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  // TODO: Sửa fixed width
                                  width: 150,
                                  margin: EdgeInsets.only(left: 15.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF83C5BD),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Username",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFffffff)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF83C5BD),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "1000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFffffff)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  // TODO: Sửa fixed width
                                  width: 150,
                                  margin: EdgeInsets.only(top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Username",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "1000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  // TODO: Sửa fixed width
                                  width: 150,
                                  margin: EdgeInsets.only(left: 15.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF83C5BD),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Username",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFffffff)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF83C5BD),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "1000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFffffff)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  // TODO: Sửa fixed width
                                  width: 150,
                                  margin: EdgeInsets.only(top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Username",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 20.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "1000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: RaisedButton(
                            color: Color(0xFFffffff),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                              child: Text(
                                "Play again",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF38AE9C)),
                              )
                            ),
                            onPressed: () {},
                          )
                        ),
                      ],
                    ),
                  ],
                )
              )
            )
          ],
        ),
        // Page 07.1 - Explore Topic
        // Page 07.2 - Explore Question
      ),
    );
  }
}
