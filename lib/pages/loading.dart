
import 'package:flutter/material.dart';
import 'package:world_clock/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
  WorldTime instance =WorldTime(location: 'London', flag: 'germany.png', url: 'Europe/london');
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isdaytime':instance.isdaytime,
   });

  }

  @override
  void initState() {

    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
        child:  SpinKitRipple(
          color:Colors.white,
          size: 50.0,
        ),
        )
    );

  }
}
