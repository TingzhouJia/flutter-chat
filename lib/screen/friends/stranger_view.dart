import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'stranger_view.g.dart';

abstract class StrangerViewModel
    implements Built<StrangerViewModel, StrangerViewModelBuilder> {


  //target we are chat with
  Stranger get target;

  StrangerViewModel._();

  factory StrangerViewModel(
      [void Function(StrangerViewModelBuilder) updates]) =
  _$StrangerViewModel;


  static fromStore() {
    return (Store<AppState> store) {
      return StrangerViewModel((u) =>
      u
        ..target=store.state.stranger.toBuilder()
      );
    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}