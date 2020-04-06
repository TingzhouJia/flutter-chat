import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:learnflutter/screen/user/user_reset_view.dart';
import 'package:learnflutter/screen/user/user_view.dart';
import 'package:learnflutter/service/userInfoService.dart';

class ResetInfo extends StatefulWidget {
  String title;
  final callFunc;

  ResetInfo({this.title, this.callFunc});

  @override
  _ResetInfoState createState() => _ResetInfoState();
}
List iconsList=[
  [FaIcon(FontAwesomeIcons.solidCircle,color: Colors.green,),"Online"],
  [FaIcon(FontAwesomeIcons.smile,color: Colors.yellow,),"Callme"],
  [FaIcon(FontAwesomeIcons.clock,color: Colors.grey,),"Offline"],[FaIcon(FontAwesomeIcons.ban,color: Colors.red,),"No Interrupt"],
  [FaIcon(FontAwesomeIcons.bed,color: Colors.grey,),"Sleeping"],[FaIcon(FontAwesomeIcons.gamepad,color: Colors.blueGrey,),"Gaming"],
  [FaIcon(FontAwesomeIcons.laptop,color: Colors.blueGrey,),"Working"],[FaIcon(FontAwesomeIcons.bookOpen,color: Colors.blueGrey,),"Studying"],
  [FaIcon(FontAwesomeIcons.ship,color: Colors.green,),"Vocation"],[FaIcon(FontAwesomeIcons.plane,color: Colors.green,),"Flying"],
];
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
      onChanged: (data){
       setState(() {
         text_content=data;
       });
      },
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
                maxTime: DateTime(2025, 12, 31), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
              setState(() {
                text_content=new DateFormat("yyyy-MM-dd ").format(date);
                selection=date;
              });

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
    return GestureDetector(
      onTap: (){
        setState(() {
          text_content=faIcon[1];
        });
      },
      child: Container(
        height: 20,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0),right: Radius.circular(15.0) ),
            border: text_content==faIcon[1]?Border.all(color: Colors.blue):Border.all( color: Colors.white)
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            faIcon[0],
            Text(faIcon[1])
          ],
        ),
      ),
    );
  }
  Widget StatusContainer(){
      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, childAspectRatio: 1.0
      ),itemCount: iconsList.length, itemBuilder: (context,index){
          return _icon(iconsList[index]);
      });

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

  _buildScaffold(context,UserScreenViewModel vm){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Revise ${widget.title}'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              if(widget.callFunc==text_content){
                return ;
              }
              switch(widget.title){
                case "Username":
                  StoreProvider.of<AppState>(context).dispatch(UpdateUserName(user:vm.user,name: text_content));
                  break;
                case "Gender":
                  StoreProvider.of<AppState>(context).dispatch(UpdateUserGender(user:vm.user,gender: text_content));
                  break;
                case "Location":
                  StoreProvider.of<AppState>(context).dispatch(UpdateUserLocation(user:vm.user,Location: text_content));
                  break;
                case "Status":

                  StoreProvider.of<AppState>(context).dispatch(UpdateUserStatus(user:vm.user,status: text_content));
                  break;
                case "Birthday":
                  StoreProvider.of<AppState>(context).dispatch(UpdateUserBirthday(user:vm.user,birthday: selection));
                  break;
              }
              Navigator.of(context).pop();
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
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserScreenViewModel>(
      converter: UserScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildScaffold(context, vm),
      distinct: true,
    );
  }
}
