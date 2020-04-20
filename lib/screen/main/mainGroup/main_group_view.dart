
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'main_group_view.g.dart';

abstract class MainGroupScreenViewModel
    implements Built<MainGroupScreenViewModel, MainGroupScreenViewModelBuilder> {

  void Function(String uid) get loadMainGroup;
  String get uid;
  BuiltList<Channel> get currentGroups;

  MainGroupScreenViewModel._();

  factory MainGroupScreenViewModel(
      [void Function(MainGroupScreenViewModelBuilder) updates]) =
  _$MainGroupScreenViewModel;


  static fromStore() {
    return (Store<AppState> store) {
      return MainGroupScreenViewModel((u) => u
       ..currentGroups=ListBuilder(store.state.groupList)
          ..uid=store.state.user.uid
          ..loadMainGroup=(id)=>store.dispatch(LoadGroup(id))
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}