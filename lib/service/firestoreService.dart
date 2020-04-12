class FirestorePaths {
  static const PATH_GROUPS = "groups";
  static const PATH_FRIEND = "friends";
  static const PATH_MESSAGES = "message";
  static const Path_RECENT="recentChat";
  static const PATH_USERS = "user";
  static const PATH_FAVOR = "favorUser";

  static String groupPath(String groupId) {
    return "$PATH_GROUPS/$groupId";
  }
  static String friendPath(String userId){
    return "$PATH_FRIEND/$userId";
  }
  static String favorPath(String userId){
    return "$PATH_FAVOR/$userId";
  }

//  static String channelsPath(String groupId) {
////    return "$PATH_GROUPS/$groupId/$PATH_CHANNELS";
////  }
////
////  static String channelPath(String groupId, String channelId) {
////    return "$PATH_GROUPS/$groupId/$PATH_CHANNELS/$channelId";
////  }
////
////  static String channelUsersPath(String groupId, String channelId) {
////    return "$PATH_GROUPS/$groupId/$PATH_CHANNELS/$channelId/$PATH_USERS";
////  }
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
}