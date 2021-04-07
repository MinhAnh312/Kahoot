import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/question_module/question_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#38AE9C"),
      appBar: AppBar(
        backgroundColor: HexColor("#38AE9C"),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              'assest/back_button.png',
              height: 24,
              width: 14,
            ),
          ),
        ),
        title: Text(
          "Question 2/5",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Obx(() => Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  "Placeholder question:",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              questionText("1 + 1 = ?"),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 22, bottom: 75, left: 25, right: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "${questionController.start}",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: HexColor("#83C5BD")))),
                    SizedBox(height: 20),
                    Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: questionController.choose.length,
                        itemBuilder: (context, int index) {
                          HexColor backGroundColor;
                          HexColor textColor;
                          if (questionController.indexChoose.value == index) {
                            backGroundColor = HexColor("#38AE9C");
                            textColor = HexColor("#FFFFFF");
                            if (!questionController.isTrue.value) {
                              backGroundColor = HexColor("#D04A4E");
                            }
                          } else {
                            backGroundColor = HexColor("#FFFFFF");
                            textColor = HexColor("#38AE9C");
                          }
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (questionController.start.value > 0) {
                                  questionController.chooseAnswer(index);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: backGroundColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: HexColor("#38AE9C"))),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                questionController.choose[index],
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: textColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 15);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget questionText(String question) {
    return Center(
      child: Text(
        question,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800, fontSize: 22, color: Colors.white),
      ),
    );
  }
}
