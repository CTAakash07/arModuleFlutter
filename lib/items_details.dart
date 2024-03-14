import 'package:flutter/material.dart';
import 'package:testing_app/ar_view_screen.dart';
import 'package:testing_app/item_model.dart';
import 'package:testing_app/items_lists_widget.dart';

class ItemDetailsPage extends StatefulWidget {

  ItemDetailsPage({super.key,required this.clickedData});

  ItemsModel clickedData;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Date Details Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => ArVirtualView(
              clickedImage : widget.clickedData.itemImage.toString(),
            )));
          },
          label: Text("View In AR Module"),
          icon: Icon(
            Icons.mobile_screen_share_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.blueAccent.withAlpha(30),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.height / 3,
                  margin: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.clickedData.itemImage.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.blueAccent.withAlpha(50),
                        width: 2.0,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.clickedData.sellerName.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.clickedData.sellerPhone.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.clickedData.itemName.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.clickedData.itemDescription.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "₹ ${widget.clickedData.itemPrice.toString()}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent.shade700,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
