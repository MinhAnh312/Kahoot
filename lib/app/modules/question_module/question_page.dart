import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/modules/question_module/question_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';
import 'package:khoot/app/theme/app_colors.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var status = questionController.room.value.status;
      Widget widget;
      if (status == Const.START) {
        widget = startBuild();
      } else if (status == Const.PENDING)
        widget = pendingBuild();
      else if (status == Const.RESULT)
        widget = endBuild(context);
      else
        widget = Container(
          alignment: Alignment.center,
          child: Text("Đợi chờ tín hiệu từ host"),
        );
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
            "Question ${questionController.room.value.indexQuestion}/${questionController.room.value.totalQuestion}",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Center(child: widget),
      );
    });
  }

  Widget questionText(String question) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget pendingBuild() {
    return Center(
      child: Text(
        "Bạn đã sẵn sàng chưa",
        style: GoogleFonts.montserrat(fontSize: 20, color: white),
      ),
    );
  }

  Widget startBuild() {
    return Obx(() => SingleChildScrollView(
          child: Column(
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
              questionText(questionController.question.ask ?? ""),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                questionController.choose[index],
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
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
          ),
        ));
  }

  Widget endBuild(BuildContext context) {
    return Obx(() {
      List<UserJoin> listUser = questionController.listUser;
      listUser.sort((a, b) => b.score.compareTo(a.score));
      return Container(
        height: 500,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: white,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 28),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Result: ",
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
                )),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 28),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            listUser[index].name ?? "",
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: white),
                          ),
                        ),
                        Text(
                          "${listUser[index].score}" ?? "",
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: white),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: listUser.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 17);
              },
            ),
          ],
        ),
      );
    });
  }
}
