import 'package:flutter/material.dart';
import 'airplay_screen.dart';
import 'package:battery/battery.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget{
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  bool hide = false;
  void _messageSwitch(bool val) {
    setState(() {
      check = val;
    });
  }
  void _hideSwitch(bool val) {
    setState(() {
      hide = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1,228,248,248),
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width:400.0,
              height:167.0,
              margin: const EdgeInsets.only(bottom:12.0),
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: new CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'images/mine.jpg',
                ),
              ),
            ),
            new Text(
              '不忘初心',
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(top:8.0),
                margin: const EdgeInsets.only(top:30.0),
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
                        Icons.message,
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
                          new Text('消息通知')
                        ]
                    )),
                    new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                    ),
                    new Switch(
                      value: check,
                      activeColor: Colors.blue,     // 激活时原点颜色
                      onChanged: (bool val) {
                        print(val);
                        _messageSwitch(val);
                      },
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                    ),
                  ],
                )
            ),

            //第二行设置
            new Container(
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
                        Icons.explore,
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
                          new Text('一键隐藏')
                        ]
                    )),
                    new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                    ),
                    new Switch(
                      value: hide,
                      activeColor: Colors.blue,     // 激活时原点颜色
                      onChanged: (bool val) {
                        print(val);
                        _hideSwitch(val);
                      },
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 16.0),
                    ),
                  ],
                )
            ), //第二行结束
            // line 3
            new Container(
                child: new AirplayScreen()
            ),
            // line3 end
            new Container(
              margin:const EdgeInsets.only(top:40.0),
              child: FlatBtn(),
            )
          ],
        ),
      ),
    );
  }
}


class FlatBtn extends StatelessWidget {
  _log() {
    print("点击了扁平按钮");
    // 导航
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        print("点击了扁平按钮");
        Navigator.push(context,MaterialPageRoute(builder: (context) => new SecondScreen()));
      },
      child: Text("更多设置"),
      color: Colors.blue,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}

class SecondScreen extends StatelessWidget{
  int _counter = 0;
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text('设置页面:访问native API')),
      body:Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
            new RaisedButton(
                child:Text('浏览器打开地址'),
                color:Colors.lightBlue,
                onPressed: (){
                  _launchURL();
                }),
            new RaisedButton(
                child:Text('查看电量信息'),
                color:Colors.lightBlue,
                onPressed: (){
                  print('查看电量信息');
//                  _launchURL();
                  var battery = Battery();
                  print(battery);

//              battery.onBatteryStateChanged.listen((BatteryState state) {
                  // Do something with new state
//              });
//          Navigator.pop(context);
                }),
          ],
        ),
      )
    );

  }

}

