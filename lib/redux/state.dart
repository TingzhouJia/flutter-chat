
import 'package:learnflutter/model/user.dart';




class AppState{
    User get  user;
    bool  status;
    AppState({this.user,this.status});

    AppState copyWith({
      User userState,
      bool statusState
    }) {
      return AppState(
        user: userState ?? this.user,
        status: statusState ?? this.status
      );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
            other is AppState && user == other.user;
}