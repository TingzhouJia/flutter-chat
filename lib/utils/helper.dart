
enum SYSTEM_DISPATCH{ GROUP,RECOMMEND}
class SystemDispatchHelper{
  static String stringOf(SYSTEM_DISPATCH dispatch) {
    switch (dispatch) {
      case SYSTEM_DISPATCH.GROUP:
        return "OPEN";
      case SYSTEM_DISPATCH.RECOMMEND:
        return "CLOSED";
    }
    return null;
  }
  static SYSTEM_DISPATCH valueOf(String string) {
    switch (string) {
      case "OPEN":
        return SYSTEM_DISPATCH.GROUP;
      case "CLOSED":
        return SYSTEM_DISPATCH.RECOMMEND;
    }
    return null;
  }
}