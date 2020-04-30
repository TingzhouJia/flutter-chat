
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'channel_view.g.dart';

abstract class ChannelScreenViewModel
    implements Built<ChannelScreenViewModel, ChannelScreenViewModelBuilder> {

  Channel get curChannel;

  @nullable
  BuiltList<User> get userList;
  @nullable
  BuiltList<User> get newInvitation;

  ChannelScreenViewModel._();

  factory ChannelScreenViewModel(
      [void Function(ChannelScreenViewModelBuilder) updates]) =
  _$ChannelScreenViewModel;


  static fromStore(isNew) {

    return (Store<AppState> store)  {

    return ChannelScreenViewModel((c)=>c
        ..curChannel=isNew?store.state.strangeChannel.toBuilder():store.state.selectedGroup.curChannel
        ..userList=isNew?ListBuilder():ListBuilder(store.state.selectedGroup.users)
        ..newInvitation=isNew?ListBuilder():ListBuilder(store.state.selectedGroup.newInvitation)
    );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}