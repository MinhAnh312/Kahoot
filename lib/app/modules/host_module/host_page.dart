import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/theme/HexColor.dart';
import 'package:khoot/app/theme/app_colors.dart';
import 'host_controller.dart';

class HostPage extends StatefulWidget {
  final String hostID;

  const HostPage({Key key, this.hostID}) : super(key: key);

  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  HostController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = Get.put(HostController(roomId: widget.hostID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Host Page ${widget.hostID}",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 28),
            child: Obx(() => Text(
                  "Question ${controller.indexQuestion}/${controller.totalQuestion}",
                  style: GoogleFonts.sarabun(color: Colors.black, fontSize: 20),
                )),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 28),
            child: Obx(() => Text(
              "Status: ${controller.status}",
              style: GoogleFonts.sarabun(color: Colors.black, fontSize: 20),
            )),
          ),
          SizedBox(height: 20),
          listUser(context),
          SizedBox(height: 60),
          Obx(
            () => buttonPlay(
                context, controller.buttonGame.value, "#F6E084", Colors.black,
                () {
              if (controller.buttonGame.value == Const.START) {
                controller.startGame();
              }
              if (controller.buttonGame.value == Const.NEXT_QUESTION) {
                controller.nextQuestion();
              }
            }),
          ),
          SizedBox(height: 20),
          buttonPlay(context, "Result", "#F6E084", Colors.black, () {
            controller.showResult();
          }),
          SizedBox(height: 20),
          buttonPlay(context, "Reset", "#F6E084", Colors.black, () {
            controller.reset();
          })
        ],
      )),
    );
  }

  Widget listUser(BuildContext context) {
    return Obx(() {
      List<UserJoin> listUser = controller.listUser;
      listUser.sort((a, b) => b.score.compareTo(a.score));
      return Container(
        height: 240,
        child: ListView.separated(
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 28),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(10)),
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
      );
    });
  }

  Widget buttonPlay(BuildContext context, String title, String color,
      Color fontColor, VoidCallback voidCallback) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 28),
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
