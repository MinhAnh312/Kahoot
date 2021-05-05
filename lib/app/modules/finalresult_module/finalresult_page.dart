import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/finalresult_module/finalresult_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class FinalResultPage extends GetWidget<FinalResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#38AE9C"),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          child: Text(
                            'Scoreboard',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        )
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    child: Text(
                                      'Mark',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    child: Text(
                                      '10000',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Mark',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        '10000',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      child: Text(
                                        'Mark',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      child: Text(
                                        '10000',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Mark',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        '10000',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      child: Text(
                                        'Mark',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      child: Text(
                                        '10000',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Mark',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        '10000',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}