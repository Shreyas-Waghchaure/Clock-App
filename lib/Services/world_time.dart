

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
 late String flag; // ural to assets flag img
 late String url; // location url for api
 late bool isdaytime;
  // ignore: empty_constructor_bodies
  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {
    try{// make the request
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set time property
      isdaytime = now.hour > 6 && now.hour<20 ? true :false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('cought error: $e');
      time = 'could not get time data';
    }
    }

}

WorldTime instance =WorldTime(location: 'London', flag: 'germany.png', url: 'Europe/london');