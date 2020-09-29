// import 'dart:io';
// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

PickedFile imageFile;
 
class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var _picker = ImagePicker();
  void takePhotoByCamera() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });
  }

  void takePhotoByGallery() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
  }

  void removePhoto() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      height: 250.0,
      width: 250.0,
      // margin: EdgeInsets.only(left: 30.0, top: 25.0),
      child: Column(
        children: <Widget>[
          Text(
            "Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 20.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: takePhotoByCamera,
                  label: Text("Camera"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: takePhotoByGallery,
                  label: Text("Gallery"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: removePhoto,
                  label: Text("Remove"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}