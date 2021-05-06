import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/modules/result_module/result_controller.dart';
import 'package:khoot/app/theme/HexColor.dart';

class ResultPage extends GetWidget<ResultController> {
  final int result;

  ResultPage(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#38AE9C"),
      body: Center(
        child: Text("Điểm của bạn là: $result"),
      ),
    );
  }
}

Widget buttonPlay(BuildContext context, String title, String color,
    Color fontColor, VoidCallback voidCallback) {
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
            fontWeight: FontWeight.w600, fontSize: 14, color: fontColor),
      ),
    ),
  );
}