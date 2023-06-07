import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data=data.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:data;
    //print(data);

    //set background
    String bgimage= data['isday']?'day.jpg':'night.jpg';
    Color txt= data['isday']? Colors.black:Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
          children: [
            TextButton.icon(
              onPressed: () async{
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data={
                    'time': result['time'],
                    'location': result['location'],
                    'isday': result['isday'],
                    'flag': result['flag']
                  };
                });
              },
                icon:Icon(Icons.edit_location,
                  color: txt,
                  size: 18,
                ),
                label: Text(
                      'edit location',
                      style: TextStyle(
                        color: txt,
                        fontFamily: 'apple',
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                ),
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    color: txt,
                    fontSize: 50,
                    letterSpacing: 2,
                    fontFamily: 'apple',
                      fontWeight:FontWeight.w800

                  ),
                ),
              ],
              ),
                SizedBox(height: 120,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: txt,
                    fontSize: 85,
                    fontFamily: 'clock',
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
