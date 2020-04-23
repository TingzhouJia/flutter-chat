class FirestorePaths {
  static const PATH_GROUPS = "group";
  static const PATH_FRIEND = "friends";
  static const PATH_MESSAGES = "message";
  static const Path_RECENT="recentChat";
  static const PATH_USERS = "user";
  static const PATH_FAVOR = "favorUser";
  static const USER_GROUP="userGroup";
  static String groupPath(String groupId) {
    return "$PATH_GROUPS/$groupId";
  }

  static String favorPath(String userId){
    return "$PATH_FAVOR/$userId";
  }


////
  static String groupMessagePath(String groupId,) {
    return "$PATH_MESSAGES/group/$groupId";
  }
////
  static String channelUsersPath(String userId, String groupId) {
    return "$USER_GROUP/$userId/info/$groupId";
  }
////

  static String messagePath(String sender,String receiver) {
    return "$PATH_MESSAGES/$sender/$receiver";
  }

  static String messageReactPath(
  String sender,String receiver,
      String messageId,
      ) {
    return "$PATH_MESSAGES/$sender/$receiver/$messageId";
  }
  static String RecentPath(String user){
    return "$Path_RECENT/$user";
  }
  static String updateRecentPath(String sender, receiver){
    return "$Path_RECENT/$sender/$receiver/info";
  }

  static String userPath(String userId) {
    return "$PATH_USERS/$userId";
  }
  static String friendPath(String userId,String targetid){
    return "$PATH_FRIEND/$userId/info/$targetid";
  }
}