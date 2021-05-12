import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khoot/app/data/model/question.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/modules/host_module/host_page.dart';
import 'package:khoot/app/theme/HexColor.dart';
import 'package:khoot/app/theme/app_colors.dart';

import 'explore_room_controller.dart';

class ExploreRoomPage extends StatefulWidget {
  const ExploreRoomPage({Key key}) : super(key: key);

  @override
  _ExploreRoomPageState createState() => _ExploreRoomPageState();
}

class _ExploreRoomPageState extends State<ExploreRoomPage> {
  final TextEditingController roomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ExploreRoomController controller = Get.put(ExploreRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#38AE9C"),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (controller.isCreateHost.value) {
              controller.checkHost();
            } else
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
          "Create Room ",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() {
            return controller.isCreateHost.value
                ? Column(
                    children: [
                      SizedBox(height: 10),
                      textInput(roomController, "Room name"),
                      SizedBox(height: 10),
                      textInput(descriptionController, "Description"),
                      SizedBox(height: 20),
                      Text(
                        "Choose Quiz",
                        style:
                            GoogleFonts.montserrat(color: green, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      listQuest(context),
                      SizedBox(height: 30),
                      buttonPlay(context, "Go", "#F6E084", Colors.black, () {
                        controller
                            .createRoom(
                                roomController.text, descriptionController.text)
                            .then((value) {
                          if (value == "" || value == null) {
                            Get.to(HostPage(hostID: roomController.text));
                          } else {
                            final snackBar = SnackBar(content: Text(value));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      })
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 28),
                          alignment: Alignment.centerLeft,
                          child: Text("List Room",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black, fontSize: 20))),
                      SizedBox(height: 10),
                      listRoom(context),
                      buttonPlay(context, "Tạo host", "#F6E084", Colors.black,
                          () {
                        controller.createHost();
                      })
                    ],
                  );
          }),
        ),
      ),
    );
  }

  Widget textInput(TextEditingController controller, String hintText) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints(minHeight: 41),
      child: TextFormField(
        controller: controller,
        //textAlign: TextAlign.center,
        maxLines: null,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: green)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: green)),
          isDense: true,
          hintText: hintText,
          hintStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 14),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget listQuest(BuildContext context) {
    return Obx(() {
      List<Question> listQuestion = controller.totalQuestion;
      return Container(
        height: 310,
        child: ListView.separated(
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  listQuestion[index].isSelect = !listQuestion[index].isSelect;
                  if (listQuestion[index].isSelect) {
                    controller.addQuestion(listQuestion[index]);
                  } else {
                    controller.removeQuestion(listQuestion[index]);
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 28),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                    color: listQuestion[index].isSelect ? Colors.red : green,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  listQuestion[index].ask ?? "",
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 14, color: white),
                ),
              ),
            );
          },
          itemCount: listQuestion.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 17);
          },
        ),
      );
    });
  }

  Widget listRoom(BuildContext context) {
    return Obx(() {
      List<RoomInfo> listRoom = controller.listRoom;
      return Container(
        height: 240,
        child: ListView.separated(
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(HostPage(
                  hostID: listRoom[index].roomId,
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 28),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  listRoom[index].roomId ?? "",
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 14, color: white),
                ),
              ),
            );
          },
          itemCount: listRoom.length,
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
