import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time1='loading';
  void setupworldtime() async{
    worldtime instance= worldtime(location: 'Kolkata',flag: 'india.png',url: 'Asia/Kolkata');
    await instance.gettime();
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isday':instance.isday,
    });

  }


  @override
  void initState(){
    super.initState();
    setupworldtime();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SpinKitWave(
          color: Colors.deepPurple[100],
          size: 100,
        ),

      ),
    );
  }
}
