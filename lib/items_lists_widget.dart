import 'package:flutter/material.dart';
import 'package:testing_app/item_model.dart';
import 'package:testing_app/items_details.dart';

class ItemsListWidget extends StatefulWidget {
  ItemsListWidget({super.key,this.itemData,this.context});

  ItemsModel? itemData;
  BuildContext? context;

  @override
  State<ItemsListWidget> createState() => _ItemsListWidgetState();
}

class _ItemsListWidgetState extends State<ItemsListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => ItemDetailsPage(clickedData: widget.itemData!,)));
      },
      splashColor: Colors.deepPurpleAccent.shade100,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5,bottom: 5,left: 5),
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                      (widget.itemData?.itemImage.toString() ?? ""),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      (widget.itemData?.sellerName.toString() ?? ""),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      (widget.itemData?.sellerPhone.toString() ?? ""),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      (widget.itemData?.itemName.toString() ?? ""),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      (widget.itemData?.itemDescription.toString() ?? ""),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "₹ ${(widget.itemData?.itemPrice.toString() ?? "")}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      (widget.itemData?.status.toString() ?? ""),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}