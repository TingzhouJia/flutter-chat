
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'mainFriend_view.g.dart';

abstract class MainFriendScreenViewModel
    implements Built<MainFriendScreenViewModel, MainFriendScreenViewModelBuilder> {

  BuiltList<User> get friendList;
  BuiltMap<String,double> get groupList;
  MainFriendScreenViewModel._();

  factory MainFriendScreenViewModel(
      [void Function(MainFriendScreenViewModelBuilder) updates]) =
  _$MainFriendScreenViewModel;

  static Map getMap(BuiltList<User> _ListDatas){
    final Map _groupMap={
    };
        var _groupOffset = 54.0 * 4;
    for (int i = 0; i < _ListDatas.length; i++) {
      if(i <1){
        //第一个一定是头部
        _groupMap.addAll({_ListDatas[i].name.substring(0,1):_groupOffset});
        _groupOffset +=84 ;
      }else if(_ListDatas[i].name.substring(0,1).toUpperCase() == _ListDatas[i -1].name.substring(0,1).toUpperCase()){
        //如果没有头
        _groupOffset +=54;
      }else{
        _groupMap.addAll({_ListDatas[i].name.substring(0,1).toUpperCase():_groupOffset});
        _groupOffset +=84 ;
      }
    }
    return _groupMap;
  }
  static fromStore() {
    return (Store<AppState> store) {
      return MainFriendScreenViewModel((u) => u
        ..friendList=ListBuilder(store.state.Friends)
        ..groupList=MapBuilder(getMap(store.state.Friends))
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}