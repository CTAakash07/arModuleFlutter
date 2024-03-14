import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsModel {

  dynamic itemID;
  dynamic sellerName;
  dynamic sellerPhone;
  dynamic itemName;
  dynamic itemPrice;
  dynamic itemDescription;
  dynamic itemImage;
  Timestamp? publishedDate;
  dynamic status;

  ItemsModel({
    this.itemID,
    this.sellerName,
    this.sellerPhone,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemDescription,
    this.publishedDate,
    this.status,
  });

  ItemsModel.fromJsom(Map<String, dynamic> json) {
    itemID = json["itemID"];
    sellerName = json["sellerName"];
    sellerPhone = json["sellerPhone"];
    itemName = json["itemName"];
    itemPrice = json["itemPrice"];
    itemImage = json["itemImage"];
    itemDescription = json["itemDescription"];
    publishedDate = json["publishedDate"];
    status = json["status"];
  }

}