import 'package:flutter/material.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/screen/chat_screen.dart';
import 'package:learnflutter/utils/timeDuration.dart';
import 'package:intl/intl.dart';

class RecentChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chat = messageList[index];
                final time =
                    new DateFormat.jm().format(DateTime.parse(chat.time));
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(
                                user: chat.sender,
                              ))),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: chat.unRead ? Color(0xFFffe6eb) : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfff0efef),
                            blurRadius: 5.0,
                            offset: Offset(3.0,3.0)
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(chat.sender.imgUrl),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueGrey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 5.0),
                            Text(
                              time,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            getDuration(chat.time) < 30
                                ? Container(
                                    width: 40.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Theme.of(context).primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Text('')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
