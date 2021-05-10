import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/question_module/question_page.dart';
import 'package:khoot/app/theme/HexColor.dart';

import 'entername_controller.dart';

class EnterNamePage extends GetWidget<EnterNameController> {
  final EnterNameController enterNameController = Get.put(EnterNameController());
  final TextEditingController nameController = TextEditingController();

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Image.asset('assest/Login.png', height: 70),
              ),
              SizedBox(height: 61),
              textInput("Enter your nickname"),
              SizedBox(height: 22),
              buttonPlay(context, "Go", "#F6E084", Colors.black, () {
                enterNameController.joinRoom(nameController.text).then((value) {
                  if(value){
                    Get.to(QuestionPage());
                  }
                  else {
                    final snackBar = SnackBar(content: Text('Tên đã trùng vui lòng đổi tên'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              })
            ],
          )
        ],
      ),
    );
  }

  Widget textInput(String hintText) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 41),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints(minHeight: 41),
      child: TextFormField(
        controller: nameController,
        textAlign: TextAlign.center,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hintText,
          hintStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 14),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buttonPlay(BuildContext context, String title, String color,
      Color fontColor, VoidCallback voidCallback) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 41),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: HexColor(color),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, fontSize: 14, color: fontColor),
        ),
      ),
    );
  }
}
