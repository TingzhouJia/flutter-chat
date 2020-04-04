

import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'home_view.g.dart';

abstract class HomeScreenViewModel
    implements Built<HomeScreenViewModel, HomeScreenViewModelBuilder> {
  User get user;


  HomeScreenViewModel._();

  factory HomeScreenViewModel(
      [void Function(HomeScreenViewModelBuilder) updates]) =
  _$HomeScreenViewModel;

//  static bool _hasData(Store<AppState> store) {
//    return store.state.user != null;
//  }
//
  static fromStore() {
    return (Store<AppState> store) {
      return HomeScreenViewModel((u) => u
        ..user =store.state.user.toBuilder());
    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
  }
