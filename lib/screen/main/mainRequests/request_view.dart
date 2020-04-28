
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'request_view.g.dart';

abstract class RequestScreenViewModel
    implements Built<RequestScreenViewModel, RequestScreenViewModelBuilder> {
  BuiltList<Stranger> get requesterList;

  RequestScreenViewModel._();

  factory RequestScreenViewModel(
      [void Function(RequestScreenViewModelBuilder) updates]) =
  _$RequestScreenViewModel;

//  static bool _hasData(Store<AppState> store) {
//    return store.state.user != null;
//  }
//
  static fromStore() {
    return (Store<AppState> store) {
      return RequestScreenViewModel((u) => u

        ..requesterList=ListBuilder(store.state.requestList)

      );

    };
  }

}