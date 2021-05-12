import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/data/model/question.dart';
import '../../theme/HexColor.dart';
import '../../theme/app_colors.dart';
import 'edit_question_controller.dart';

class EditQuestionPage extends GetWidget<EditQuestionController> {
  final EditQuestionController hostController = Get.put(EditQuestionController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
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
          centerTitle: true,
          title: Text(
            "Create new set",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 20),
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              textInput("Name of Set", HexColor("#91919F"), white),
              SizedBox(height: 8),
              //textInput("Description", HexColor("#91919F"), white),
              SizedBox(height: 20),
              buildListQuest(context),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  "SUBMIT",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 14, color: green),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget textInput(String hintText, Color hintColor, Color fill) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 28),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration:
          BoxDecoration(color: fill, borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints(minHeight: 41),
      child: TextFormField(
        controller: searchController,
        maxLines: null,
        cursorColor: green,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: fill,
          isDense: true,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400, fontSize: 14, color: hintColor),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildListQuest(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    // textInput(
                    //     "Add question", Colors.black, HexColor("#F7DD83")),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 28),
                    //   child: Divider(
                    //     thickness: 1,
                    //     color: Color.fromRGBO(0, 0, 0, 0.3),
                    //   ),
                    // ),
                    listQuest(context),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.5, color: green),
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25))
                    ]),
                child: Text(
                  'Question',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 14, color: green),
                ),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: green,
                    border: Border.all(width: 1.5, color: green),
                    boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 2))]),
                child: Icon(
                  Icons.add_rounded,
                  color: white,
                ),
              ))
        ],
      ),
    );
  }

  Widget listQuest(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: hostController.query.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<Question> listQuestion = querySnapshot.docs
                .map((e) => Question.fromJson(e.data()))
                .toList();
            return Container(
              height: 310,
              child: ListView.separated(
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 28),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      listQuestion[index].ask ?? "",
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: white),
                    ),
                  );
                },
                itemCount: listQuestion.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 17);
                },
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
