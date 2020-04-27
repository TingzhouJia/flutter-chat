

import 'dart:io';

import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/model/stranger.dart';

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
  AddFriend(this.id,this.remarks);

}

class AgreeAddFriend{
  String uid;

  AgreeAddFriend(this.uid);

}
class RefuseAddFriend{
  String uid;

  RefuseAddFriend(this.uid);

}

class OnAddFriend{
  Friend a;

  OnAddFriend(this.a);

}
class OnchangeRequest{
  String id;

  OnchangeRequest(this.id);

}