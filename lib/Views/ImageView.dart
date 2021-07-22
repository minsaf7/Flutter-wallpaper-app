import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futtergallery/Widgets/Widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final url;
  const ImageView({Key? key, this.url}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //image
        Hero(
          tag: widget.url,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //button
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  saveImage();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white70, width: 1),
                          gradient: LinearGradient(colors: [
                            Color(0x36FFFFFF),
                            // Colors.black,
                            // Colors.grey
                            Color(0x0FFFFFFF),
                          ])),
                      child: Column(
                        children: [
                          Text(
                            "Set wallpaper",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text("Download and set wallpaper",
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 50)
            ],
          ),
        )
      ],
    ));
  }

  saveImage() async {
    print("1");
    //await _askPermission();
    var response = await Dio()
        .get(widget.url, options: Options(responseType: ResponseType.bytes));
    print("2");
    print(response.data);
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    //final result = await ImageGallerySaver.saveImage(imageBytes);
    print("3");
    print(result);
    Navigator.pop(context);
  }

  // _askPermission() async {

  //   if (Platform.isIOS) {
  //     /*Map<PermissionGroup, PermissionStatus> permissions =
  //         */await PermissionHandler()
  //             .requestPermissions([Permission.photos]);
  //   } else {
  //    /* PermissionStatus permission = */await PermissionHandler()
  //         .checkPermissionStatus(Permission.storage);
  //   }
  // }
}
