import 'dart:collection';

import 'package:flutter/material.dart';

class InfoList extends StatelessWidget {
 final String info;
 final String index;
  InfoList( {this.info,this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
            border:Border(bottom: BorderSide(width: 1.0,color: Colors.white))
        ),
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$info: ',style: TextStyle(
              color: Colors.white,
                fontWeight:FontWeight.w600 ,fontSize: 20.0
            ),),
            Row(
              children: <Widget>[
                Text(index==null?'':index,style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.w600 ,fontSize: 20.0
                ),),
                Icon(Icons.arrow_forward_ios,size: 20.0, color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
