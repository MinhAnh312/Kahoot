import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';
import 'package:khoot/app/theme/app_colors.dart';

class EnterRoomPage extends GetWidget<EnterRoomController> {
  final EnterRoomController enterRoomController = Get.put(EnterRoomController());
  final TextEditingController roomIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              textInput("Enter Room ID"),
              SizedBox(height: 22),
              buttonPlay(context, "Go", "#F6E084", Colors.black, () {
                _formKey.currentState.validate();
                enterRoomController.enterRoom(roomIdController.text);
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
      constraints: BoxConstraints(minHeight: 41, maxHeight: 60),
      child: Form(
        key: _formKey,
        child: TextFormField(
          // inputFormatters: [
          //   new LengthLimitingTextInputFormatter(6),
          //   FilteringTextInputFormatter.digitsOnly
          // ],
          validator: (text) {
            bool isTrue = enterRoomController.isExist.value;
            if (isTrue)
              return null;
            else
              return "Phòng không đúng";
          },
          controller: roomIdController,
          textAlign: TextAlign.center,
          maxLines: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: white,
            hoverColor: white,
            //isCollapsed: true,
            focusColor: white,
            //border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            isDense: true,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red)),
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 14),
            disabledBorder: InputBorder.none,
          ),
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
