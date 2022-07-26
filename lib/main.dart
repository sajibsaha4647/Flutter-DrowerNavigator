import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomPage(),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {

  final globalKey = GlobalKey<ScaffoldState>();

  final Uri _url = Uri.parse('https://flutter.dev');




  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      key: globalKey,
         appBar: AppBar(
           title: Text("drower navigation"),
           centerTitle: true,
           backgroundColor: Colors.blue,
         ),
        endDrawer: Drawer(
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.blue,
            child: Column(
              children: [
                  Text("Home")
              ],
            ),
          ),
        ),
      drawerEnableOpenDragGesture: false,
      body: Column(
        children: [
          Container(
            child: RaisedButton(onPressed: () {
              globalKey.currentState!.openEndDrawer();
            },

            ),
          ),
          RaisedButton(
              child: Text("click"),
              onPressed: (){
                launchUrl(_url);
              }
          )
        ],
      )

    ));
  }
}




