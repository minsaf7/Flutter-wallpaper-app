import 'package:flutter/material.dart';
import 'package:futtergallery/Data/APICalls.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';
import 'package:futtergallery/Widgets/Widgets.dart';

class Category extends StatefulWidget {
  final categoryTitle;
  const Category({Key? key, this.categoryTitle}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<WallpaperModel> categoryModel = [];
  bool isLoading = true;

  getImages() async {
    APICalls getTrending = APICalls();
    await getTrending.getCategoryImages(widget.categoryTitle);
    categoryModel = getTrending.wallpapers;
    print(categoryModel);
    setState(() {
      isLoading = false;
    });

    //print(searchModel);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          children: [
            isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : imageList(wallpapers: categoryModel, context: context),
          ],
        )),
      ),
    );
  }
}
