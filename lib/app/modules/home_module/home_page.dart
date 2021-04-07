
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_page.dart';
import 'package:khoot/app/modules/home_module/home_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#38AE9C"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: HexColor("#38AE9C"),
              child: Column(
                children: [
                  SizedBox(height: 45),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 116),
                      child: Image.asset(
                        'assest/Login.png',
                        height: 100,
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 31),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back, user_name",
                                style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Setting",
                                      style: GoogleFonts.dmSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    " | ",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Logout",
                                      style: GoogleFonts.dmSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 110),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(108),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(108))),
              child: Column(
                children: [
                  buttonPlay(context, "Play with a Room ID", "#F7DD83", Colors.black,(){
                    Get.to(EnterRoomPage());
                  }),
                  SizedBox(height: 24),
                  Text("OR",style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,fontSize: 14)),
                  SizedBox(height: 24),
                  buttonPlay(context, "Explore room", "#F7DD83", Colors.black,(){}),
                  SizedBox(height: 40),
                  Divider(
                    color: Colors.grey
                  ),
                  SizedBox(height: 32),
                  buttonPlay(context, "Create a new quiz set?", "#38AE9C", Colors.white,(){}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buttonPlay(BuildContext context,String title,String color,Color fontColor,VoidCallback voidCallback){
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
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
              fontWeight: FontWeight.w600, fontSize: 14,color: fontColor),
        ),
      ),
    );
  }
}
