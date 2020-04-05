import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
//List iconsList=[
//  ["assets/svg/book.svg","Online"],
////  [FaIcon(FontAwesomeIcons.smile,color: Colors.yellow,),"Callme"],
////  [FaIcon(FontAwesomeIcons.clock,color: Colors.grey,),"Offline"],[FaIcon(FontAwesomeIcons.ban,color: Colors.red,),"No Interrupt"],
////  [FaIcon(FontAwesomeIcons.bed,color: Colors.green,),"Sleeping"],[FaIcon(FontAwesomeIcons.gamepad,color: Colors.blueGrey,),"Gaming"],
////  [FaIcon(FontAwesomeIcons.laptop,color: Colors.blueGrey,),"Working"],[FaIcon(FontAwesomeIcons.bookOpen,color: Colors.blueGrey,),"Studying"],
////  [FaIcon(FontAwesomeIcons.circle,color: Colors.green,),"Online"],[FaIcon(FontAwesomeIcons.circle,color: Colors.green,),"Online"],
//];
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
  final GenderList=["Secret","Male","Female"];
  Widget GenderContainer(){
    return ListView.builder(itemBuilder: _getEach,itemCount: GenderList.length,);
  }
  Widget _getEach(BuildContext context,index){
    return GestureDetector(
      onTap: (){
        setState(() {
          text_content=index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border(bottom:BorderSide(color: Colors.blueGrey) )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(GenderList[index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0),),
            text_content==index?FaIcon(FontAwesomeIcons.check,color: Colors.green, size: 14.0,):SizedBox(width: 0,)
          ],
        ),
      ),
    );

  }

  Widget _icon(List faIcon){
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0),right: Radius.circular(15.0) ),
        color: Colors.grey
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(faIcon[0]),
          Text(faIcon[1])
        ],
      ),
    );
  }
  Widget StatusContainer(){
//      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 4, childAspectRatio: 1.0
//      ), itemBuilder: (context,index){
//          return _icon(iconsList[index]);
//      });
  SvgPicture svg1=SvgPicture.asset('assets/svg/book.svg');
  return SizedBox(
    width: 50,
    height: 50,
    child: svg1,
  );
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
