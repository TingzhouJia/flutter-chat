import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/service/userInfoService.dart';

class ResetInfo extends StatefulWidget {
  String title;
  final callFunc;

  ResetInfo({this.title, this.callFunc});

  @override
  _ResetInfoState createState() => _ResetInfoState();
}

class _ResetInfoState extends State<ResetInfo> {
  var text_content;
  var textController;
  var selection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    text_content=widget.callFunc;
    textController= new TextEditingController();

  }



  Widget InputContainer() {
    return TextField(
      controller: textController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: widget.callFunc,
        suffixIcon: IconButton(
          onPressed: () => textController.clear(),

          icon: Icon(Icons.clear),
        ),
      ),
    );
  }

  Widget BirthdayContainer() {
    return
        GestureDetector(
          onTap: (){
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime(2020, 6, 7), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
              setState(() {
                text_content=new DateFormat("yyyy-MM-dd ").format(date);
              });
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.zh);
          },
          child:


          Container(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0,right: 5.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blueGrey))
              ),
              child: Row(
                children: <Widget>[
                  Text("Date of Birth: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                  SizedBox(width: 5,),
                  Text(text_content,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),)
                ],
              ),
          ),
        );
  }
  
  Widget GenderContainer(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border(bottom: )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Male"),
              FaIcon(FontAwesomeIcons.check)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Female"),
            FaIcon(FontAwesomeIcons.check)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Secrect"),
            FaIcon(FontAwesomeIcons.check)
          ],
        )
      ],
    );
  }

  Widget StatusContainer(){

  }
  Widget buildbody(title) {
    switch (title) {
      case "Status":
        return StatusContainer();
      case "Gender":
        return GenderContainer();
      case "Birthday":
        return BirthdayContainer();
      default:
        return InputContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Revise ${widget.title}'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {

            },
            child: Center(
              child: Container(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
                ),
              ),
            ),
          )
        ],
      ),
      body: buildbody(widget.title),
    );
  }
}
