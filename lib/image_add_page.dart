import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_app/api_helper_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireBaseStore;
import 'package:testing_app/home_page.dart';

class ImageAddPage extends StatefulWidget {
  const ImageAddPage({Key? key}) : super(key: key);

  @override
  State<ImageAddPage> createState() => imageAddPage();
}


class imageAddPage extends State<ImageAddPage> {

  Uint8List? imageFileUint8List;
  bool isUploading = false;
  TextEditingController sellerName = TextEditingController();
  bool isName = false;
  TextEditingController sellerPhone = TextEditingController();
  bool isPhone = false;
  TextEditingController itemName = TextEditingController();
  bool isItem = false;
  TextEditingController itemDescription = TextEditingController();
  bool isDescription = false;
  TextEditingController itemPrice = TextEditingController();
  bool isPrice = false;
  String downLoadUrlUploadImage = "";

  @override
  Widget build(BuildContext context) {
    return imageFileUint8List == null ? addImage() : upLoad();
  }

  Widget upLoad() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ImageSelectionPage",
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed: () {

                  if (isUploading != true) {
                    validateFrom();
                  }

                },
                icon: const Icon(
                  Icons.cloud_upload,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            isUploading == true
                ? const LinearProgressIndicator(
              color: Colors.deepPurple,
            )
                : Container(),
            // Image
            SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Center(
                child: imageFileUint8List != null
                    ? Image.memory((imageFileUint8List ?? Uint8List(8)))
                    : Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.blueAccent.withAlpha(200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 2,
              ),
            ),

            // Name of the seller
            ListTile(
              leading: Icon(
                Icons.person_pin_outlined,
                color: Colors.blueAccent.withAlpha(200),
              ),
              title: SizedBox(
                width: 250,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: sellerName,
                  decoration: InputDecoration(
                    hintText: "Seller Name",
                    labelText: isName ? "Seller Name" : null,
                    hintStyle:
                    TextStyle(color: Colors.blueAccent.withAlpha(200)),
                    border: isName
                        ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent
                            .withAlpha(200), // Change the color here
                      ),
                    )
                        : InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isName = value.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 1,
              ),
            ),
            // Phone of the seller
            ListTile(
              leading: Icon(
                Icons.phone_android_outlined,
                color: Colors.blueAccent.withAlpha(200),
              ),
              title: SizedBox(
                width: 250,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: sellerPhone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Seller Phone",
                    labelText: isPhone ? "Seller Phone" : null,
                    hintStyle:
                    TextStyle(color: Colors.blueAccent.withAlpha(200)),
                    border: isPhone
                        ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent
                            .withAlpha(200), // Change the color here
                      ),
                    )
                        : InputBorder.none, // Change the color here
                  ),
                  onChanged: (value) {
                    setState(() {
                      isPhone = value.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 1,
              ),
            ),
            // title of the Item
            ListTile(
              leading: Icon(
                Icons.title,
                color: Colors.blueAccent.withAlpha(200),
              ),
              title: SizedBox(
                width: 250,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: itemName,
                  decoration: InputDecoration(
                    hintText: "item name",
                    labelText: isItem ? "item name" : null,
                    hintStyle:
                    TextStyle(color: Colors.blueAccent.withAlpha(200)),
                    border: isItem
                        ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent
                            .withAlpha(200), // Change the color here
                      ),
                    )
                        : InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isItem = value.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 1,
              ),
            ),
            // description of the item
            ListTile(
              leading: Icon(
                Icons.description,
                color: Colors.blueAccent.withAlpha(200),
              ),
              title: SizedBox(
                width: 250,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: itemDescription,
                  decoration: InputDecoration(
                    hintText: "item Description",
                    labelText: isDescription ? "item Description" : null,
                    hintStyle:
                    TextStyle(color: Colors.blueAccent.withAlpha(200)),
                    border: isDescription
                        ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent
                            .withAlpha(200), // Change the color here
                      ),
                    )
                        : InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isDescription = value.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 1,
              ),
            ),
            // price of the item
            ListTile(
              leading: Icon(
                Icons.price_change,
                color: Colors.blueAccent.withAlpha(200),
              ),
              title: SizedBox(
                width: 250,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: itemPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "item Price",
                    labelText: isPrice ? "item Price" : null,
                    hintStyle:
                    TextStyle(color: Colors.blueAccent.withAlpha(200)),
                    border: isPrice
                        ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent
                            .withAlpha(200), // Change the color here
                      ),
                    )
                        : InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isPrice = value.isNotEmpty;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.blueAccent.withAlpha(75),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addImage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          "Add New Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.add_photo_alternate_outlined,
                color: Colors.blueAccent.withAlpha(200),
                size: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50,right: 10,left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    showDailog();
                  },
                  child: const Center(
                    child: Text(
                      "Add New Item",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.withAlpha(200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDailog() {
    return showDialog(context: context, builder: (c) {
      return SimpleDialog(
        backgroundColor: Colors.white,
        title: Text(
          "item image",
          style: TextStyle(
            color:  Colors.blueAccent.withAlpha(200),
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          SimpleDialogOption(
            onPressed: (){
              captureImage();
              Navigator.pop(context);
            },
            child: Text(
              "Capture Image with camera",
              style: TextStyle(
                color: Colors.blueAccent.withAlpha(200),
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: (){
              chooseImage();
              Navigator.pop(context);
            },
            child: Text(
              "Choose Image from gallery",
              style: TextStyle(
                color: Colors.blueAccent.withAlpha(200),
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.blueAccent.withAlpha(200),
              ),
            ),
          ),
        ],
      );
    });
  }

  captureImage() async {
    // if (Permission.camera == PermissionStatus.granted) {
      try {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

        if (pickedImage != null) {
          String imagePath = pickedImage.path;
          imageFileUint8List = await pickedImage.readAsBytes();

          // Remove background
          imageFileUint8List = await ApiHelper().removeBackGround(imagePath);

          setState(() {
            imageFileUint8List;
          });
        }
      } catch (e) {
        print(e.toString());
        setState(() {
          imageFileUint8List = null;
        });
      }
    // } else {
    //   await Permission.camera.request();
    // }
  }

  chooseImage() async {

    // if ((Permission.storage == PermissionStatus.granted) && (Permission.photos == PermissionStatus.granted)) {
      try {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

        if (pickedImage != null) {
          String imagePath = pickedImage.path;
          imageFileUint8List = await pickedImage.readAsBytes();

          // Remove background
          imageFileUint8List = await ApiHelper().removeBackGround(imagePath);

          setState(() {
            imageFileUint8List;
          });
        }
      } catch (e) {
        print(e.toString());
        setState(() {
          imageFileUint8List = null;
        });
      }
    // } else {
    //   await Permission.photos.request();
    //   await Permission.storage.request();
    // }

  }

  validateFrom() async {
    if (imageFileUint8List != null) {
      if (sellerName.text.isNotEmpty &&
          sellerPhone.text.isNotEmpty &&
          itemName.text.isNotEmpty &&
          itemPrice.text.isNotEmpty &&
          itemDescription.text.isNotEmpty) {
        setState(() {
          isUploading = true;
        });

        String ImageUniqeName = DateTime.now().millisecondsSinceEpoch.toString();
        fireBaseStore.Reference firebaseRef = fireBaseStore.FirebaseStorage.instance.ref().child("Item_Images").child(ImageUniqeName);
        fireBaseStore.UploadTask uploadTaskImageFile = firebaseRef.putData(imageFileUint8List!, fireBaseStore.SettableMetadata(contentType: 'image/png'));

        fireBaseStore.TaskSnapshot takeSnapshot = await uploadTaskImageFile.whenComplete(() {

        });


        await takeSnapshot.ref.getDownloadURL().then((imageURl) {
          downLoadUrlUploadImage = imageURl;
        });

        String itemUniqueID = DateTime.now().millisecondsSinceEpoch.toString();
        FirebaseFirestore.instance.collection("items").doc(itemUniqueID).set({
          "itemID": itemUniqueID,
          "sellerName": sellerName.text,
          "sellerPhone": sellerPhone.text,
          "itemName": itemName.text,
          "itemPrice": itemPrice.text,
          "itemDescription": itemDescription.text,
          "itemImage": downLoadUrlUploadImage,
          "publishedDate": DateTime.now(),
          "status": "available",
        });

        Fluttertoast.showToast(msg: "Your new Item Uploaded Successfully");

        setState(() {
          isUploading = false;
          imageFileUint8List = null;
          downLoadUrlUploadImage = "";
        });

        Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));

      } else {
        Fluttertoast.showToast(msg: "please fill all the form every form is mandatory");
      }
    } else {
      Fluttertoast.showToast(msg: "Please select Image file");
    }
  }

}