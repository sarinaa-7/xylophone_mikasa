import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final AudioPlayer player =AudioPlayer();
    double rectHeight =80;

    //return tehe result in future 
    Future<void>playSound()async{
        await player.stop();
        await player.setSource(AssetSource('note1.wav'));

    }
    
  Widget drawRect({
    required double height,
    Color rectColor= Colors.red,
    double paddingHz=40,
  
  })
     {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHz,vertical: 10,
      ),
      child: TextButton(
        onPressed:(){
            setState(() {
              rectHeight--;
            });
        },
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: rectColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.deepOrange,
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text(
            "Xylophone",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              drawRect(height: rectHeight, rectColor: Colors.blue, paddingHz: 40),
              drawRect(height: rectHeight, rectColor: Colors.purple, paddingHz: 50),
              drawRect(height: rectHeight, rectColor: Colors.green, paddingHz: 60),
              drawRect(height: rectHeight, rectColor: Colors.grey, paddingHz: 70),
              drawRect(height: rectHeight, rectColor: Colors.green, paddingHz: 80),
              drawRect(height: rectHeight, rectColor: Colors.black, paddingHz: 120),
            drawRect(height: rectHeight, rectColor: Colors.blue, paddingHz: 150),
                         ],
          ),
        ),
      ),
    );
  }
}
