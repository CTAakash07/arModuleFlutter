import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/image_add_page.dart';
import 'package:testing_app/item_model.dart';
import 'package:testing_app/items_lists_widget.dart';

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
        title: const Text(
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
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot dataSnap) {
          if(dataSnap.hasData) {
            return ListView.separated(
                itemCount: dataSnap.data?.docs.length,
                itemBuilder: (BuildContext context, I) {
                  ItemsModel data = ItemsModel.fromJsom(
                      dataSnap.data?.docs[I].data() as Map<String,dynamic>
                  );
                  return ItemsListWidget(context: context, itemData: data,);
                }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 2,color: Colors.blueAccent.shade400,);
            },);
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "No data available",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.withAlpha(300)
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}