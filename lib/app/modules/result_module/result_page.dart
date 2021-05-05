import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/result_module/result_page.dart';
import 'package:khoot/app/modules/result_module/result_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class ResultPage extends GetWidget<ResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#38AE9C"),
      body: Stack(
        children: [
          Positioned(
              top: 67,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assest/back_button.png',
                  height: 24,
                  width: 14,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                          child: Container(
                            color: Colors.deepOrangeAccent,
                            height: 150,
                            width: 150,
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: Center(
                          child: Container(
                            color: Colors.amber,
                            height: 150,
                            width: 150,
                            child: Center(
                              child: Text(
                                'B',
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                          child: Container(
                            color: Colors.blue,
                            height: 150,
                            width: 150,
                            child: Center(
                              child: Text(
                                'C',
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: Center(
                          child: Align(
                            // alignment: Alignment.bottomRight,
                            child: Container(
                              color: Colors.deepPurpleAccent,
                              height: 150,
                              width: 150,
                              child: Center(
                                child: Text(
                                  'D',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          )
                        )
                    ),
                  ],
                ),
              ),
            //   Container(
            //     padding: EdgeInsets.symmetric(horizontal: 70),
            //     child: Image.asset('assest/Login.png', height: 70),
            //   ),
            //   SizedBox(height: 61),
            //   textInput("Enter Room ID"),
            //   SizedBox(height: 22),
            //   buttonPlay(context, "Go", "#F6E084", Colors.black, () {
            //     Get.to(EnterNamePage());
            //   })
            ],
          )
        ],
      ),
    );
  }
}