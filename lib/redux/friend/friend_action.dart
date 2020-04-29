

import 'dart:io';

import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/model/user.dart';

class UpdateCurrentTarget{
  final String uid;
  UpdateCurrentTarget(this.uid);

}
class OnUpdateCurrentTarget{
  final Friend user;
  OnUpdateCurrentTarget(this.user);
}

class UpdateFriendBackGround{
  final File file;

  UpdateFriendBackGround(this.file);

}

class UpdateSetting{
  final FriendSetting set;
  final bool result;
  UpdateSetting(this.set,this.result);

}
class UpdateNickname{
  final String nickname;
  UpdateNickname(this.nickname);

}

class OnUpdateFriend{
  final Friend friend;

  OnUpdateFriend(this.friend);

}
class DeleteFriend{

  DeleteFriend();
}

class RecommendTo{
  List<String> sendTo;

  RecommendTo(this.sendTo);

}

class GetStranger{
  String id;

  GetStranger(this.id);

}

class UpdateStranger{
  Stranger stranger;

  UpdateStranger(this.stranger);

}

class AddFriend{
  String id;
  String remarks;
  String message;
  bool notification;
  bool strongnotification;
  bool setTop;

  AddFriend(this.id, this.remarks, this.message, this.notification,
      this.strongnotification, this.setTop);


}

class AgreeAddFriend{
  String uid;
  String imgUrl;
  AgreeAddFriend(this.uid,this.imgUrl);

}
class RefuseAddFriend{
  String uid;

  RefuseAddFriend(this.uid);

}

class OnAddFriend{
  Friend a;
  User user;

  OnAddFriend(this.a,this.user);

}
class OnchangeRequest{
  String id;

  OnchangeRequest(this.id);

}

class FilterStranger{
  String id;

  FilterStranger(this.id);

}