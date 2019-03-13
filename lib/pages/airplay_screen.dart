import 'package:flutter/material.dart';

class AirplayScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return new Container(
        padding: const EdgeInsets.only(top:8.0,bottom:8.0),
        color:Colors.white,
        child: new Row(
          children:[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new Text(
                '',
                style: new TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            new Icon(
                Icons.edit,
                color: Colors.blue[500],
                size:19.0
            ),
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new Text(
                '',
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            new Expanded(child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text('修改密码')
                ]
            )),
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
            ),
            new Icon(
                Icons.arrow_forward,
                color: Colors.blue[500],
                size:19.0,
            ),
            new Container(
              margin: const EdgeInsets.only(right: 25.0),
            ),
          ],
        )
    );
  }

}
