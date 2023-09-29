
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitMode();
        } else {
          return LandscapeMode();
        }
      }),
    );
  }
}


class PortraitMode extends StatelessWidget {
  const PortraitMode({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, index){
        return Container(
          padding: EdgeInsets.only(top: 10),
          height: 150,
          child: Image.network('https://via.placeholder.com/150'),
        );
      }, separatorBuilder: (BuildContext context, int index) { 
        return Divider(
          height: 1,
          thickness: 2,
          indent: 8,
          endIndent: 8,
        );
       },
      );
  }
}



class LandscapeMode extends StatelessWidget {
  const LandscapeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) {
              return Container(
                child: Image.network('https://via.placeholder.com/150',
                ),
              );
            },
          );
  }
}