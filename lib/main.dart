import 'package:flutter/material.dart';
import './rectangle_page.dart';
import './temperature_page.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
      /*routes: {
        '/rectangle_page': (context) => RectanglePage(),
        '/temperature_page': (context) => TemperaturePage(),
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int current = 0;

  //list เปลี่ยนหน้า
  final List<Widget> pages = [
    HomePage(),
    RectanglePage(),
    TemperaturePage(),
  ];

  //list เปลี่ยนหัวข้อ
  final List<String> titles = [
    "หน้าแรก",
    "พื้นที่สี่เหลี่ยมผืนผ้า",
    "แปลงอุณหภูมิ"
  ];

  //list เก็บข้อมูล Icon title
  final List<IconData> titleIcon = [
      Icons.home,
      Icons.rectangle,
      Icons.thermostat,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          titleIcon[current],
          size: 30,
        ),
        title: Text(
          titles[current],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body:SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: pages[current],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff26648e),
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Homepage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rectangle_outlined),
            label: "Rectangle",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat),
            label: "Temperature",
          ),
        ],
      ),
    );
  }
}
