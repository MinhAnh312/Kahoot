import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/home_module/home_page.dart';
import 'package:khoot/app/modules/login_module/login_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor("#38AE9C"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: HexColor("#38AE9C"),
              child: Column(
                children: [
                  SizedBox(height: 159),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      child: Image.asset('assest/Login.png')),
                  SizedBox(height: 48),
                  GestureDetector(
                    onTap: (){
                      Get.to(HomePage());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: HexColor("#F7DD83"),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 73),
                      child: Text(
                        "Go straight into a room?",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "OR",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 22),
              color: Colors.white,
              child: Column(
                children: [
                  textInput("Username", "assest/mail.png"),
                  SizedBox(height: 20),
                  textInput("Password", "assest/lock.png"),
                  SizedBox(height: 20),
                  button(context, "Sign In"),
                  SizedBox(height: 10),
                  Text(
                    "Forgot your Password?",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Divider(indent: 1, color: Colors.grey),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Don’t have an account?",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10),
                  button(context, "Sign Up"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textInput(String hintText, String icon) {
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: TextFormField(
        maxLines: null,
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: HexColor("#FCFCFF"),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 14),
            disabledBorder: InputBorder.none,
            prefixIcon: InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment(-0.5, 0),
                child: Image.asset(
                  icon,
                  width: 20,
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(maxWidth: 50)),
      ),
    );
  }

  Widget button(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: HexColor("#38AE9C"),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          "Sign In",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w800, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
