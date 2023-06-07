
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<worldtime> locations = [
    worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldtime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south korea.png'),
    worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    worldtime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
  ];
  void updatetime(index) async{
    worldtime instance = locations[index];
    await instance.gettime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isday':instance.isday,
    });
  }
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 30, 0),
          child: Text('Choose a Location'),
        ),
        elevation: 0,

      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updatetime(index);
              },
                title:Text(
                  locations[index].location),
              leading: Image.asset('assets/${locations[index].flag}')
              ),
          );
        },
      ),
    );
  }
}
