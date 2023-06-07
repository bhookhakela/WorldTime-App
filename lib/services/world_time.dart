import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class worldtime{
  String location;
  String time='';
  String flag; //url to image of flag
  String url;
  bool isday=true;
  Future<void> gettime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String offsethr = offset.substring(1, 3);
      String offsetmin = offset.substring(4, 6);
      String plusOrMinus = data['utc_offset'].substring(0,1);
      DateTime now = DateTime.parse(datetime);
      print(now);
      if(plusOrMinus == '-'){
        now = now.subtract(Duration(hours: int.parse(offsethr), minutes: int.parse(offsetmin)));
      }else{
        now = now.add(Duration(hours: int.parse(offsethr), minutes: int.parse(offsetmin)));
      }
      isday = now.hour > 6 && now.hour< 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (error) {
      print('caught error: $error');
      time='could not get data';
    }
  }



  worldtime({required this.location,required this.flag,required this.url});
}


