import 'package:flutter/material.dart';
import 'package:futtergallery/Widgets/Widgets.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: widget.url != ""
            ? Image.network(
                widget.url,
                fit: BoxFit.cover,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
