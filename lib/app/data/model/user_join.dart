class RoomInfo {
  int indexQuestion;
  int question ;
  String roomId;
  String roomKey;
  String status;
  int totalQuestion;
  List<UserJoin> userJoin;

  RoomInfo(
      {this.indexQuestion,
        this.roomId,
        this.roomKey,
        this.status,
        this.totalQuestion,
        this.userJoin,this.question});

  RoomInfo.fromJson(Map<String, dynamic> json) {
    indexQuestion = json['index_question'];
    roomId = json['room_id'];
    roomKey = json['room_key'];
    status = json['status'];
    totalQuestion = json['total_question'];
    question = json['question'];
    if (json['user_join'] != null) {
      userJoin = <UserJoin>[];
      json['user_join'].forEach((v) {
        userJoin.add(new UserJoin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index_question'] = this.indexQuestion;
    data['room_id'] = this.roomId;
    data['room_key'] = this.roomKey;
    data['status'] = this.status;
    data['total_question'] = this.totalQuestion;
    if (this.userJoin != null) {
      data['user_join'] = this.userJoin.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserJoin {
  String name;
  int score;

  UserJoin({this.name, this.score});

  UserJoin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }
}
