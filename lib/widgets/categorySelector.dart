import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategorySelector extends StatefulWidget{
  @override
  CategorySelectorState createState()=>CategorySelectorState();

}

class CategorySelectorState extends State<CategorySelector>{

  int selectedIndex=0;
  final List<String> categories=["Messages","Online","Groups","Requests"];
  @override
  Widget build(BuildContext context) {
   return  Container(
     height: 90.0,color: Theme.of(context).primaryColor,
     child: ListView.builder(
       itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context,int index){
       return GestureDetector(
         onTap: (){
           setState((){selectedIndex=index;});
         },
         child:      Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30) ,
             child: Text(
               categories[index],
               style: TextStyle(
                   color: index==selectedIndex? Colors.white:Colors.white60,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 1.2,
                   fontSize: 24.0
               ),
             )),
       );


     },),
   );
  }

}