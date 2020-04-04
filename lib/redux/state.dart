
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/user.dart';


part 'state.g.dart';

 abstract class AppState implements Built<AppState,AppStateBuilder>{
    @nullable
    User get  user;

    AppState._();
    factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

    factory AppState.init()=>AppState((a)=>a

    );
    AppState clear() {
      // keep the temporal fcm token even when clearing state
      // so it can be set again on login.
      //
      // Add here anything else that also needs to be carried over.
      return AppState.init().rebuild((s) => s);
    }
}