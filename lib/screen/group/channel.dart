import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CurrentChannel extends StatefulWidget {
  bool NewChannel;

  CurrentChannel(this.NewChannel);

  @override
  _CurrentChannelState createState() => _CurrentChannelState();
}

class _CurrentChannelState extends State<CurrentChannel> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState;
  }
}
