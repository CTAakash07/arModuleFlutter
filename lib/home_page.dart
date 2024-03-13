import 'package:flutter/material.dart';
import 'package:testing_app/image_add_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => homeState();
}

class homeState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ar Model",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) => const ImageAddPage()));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}