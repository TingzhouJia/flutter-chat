

import 'dart:io';

import 'package:learnflutter/model/friend.dart';

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