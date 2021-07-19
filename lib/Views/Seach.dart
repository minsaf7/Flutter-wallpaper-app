import 'package:flutter/material.dart';
import 'package:futtergallery/Data/APICalls.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';
import 'package:futtergallery/Widgets/Widgets.dart';

class Search extends StatefulWidget {
  final query;
  const Search({Key? key, this.query}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchText = TextEditingController();
  List<WallpaperModel> searchModel = [];
  bool isLoading = true;
  bool onScreensearch = false;

  searchFunc() {
    print("tapped");
    print(searchText.text);
  }

  getImages() async {
    APICalls getTrending = APICalls();
    print(onScreensearch);
    if (onScreensearch) {
      await getTrending.getSearchImages(searchText.text);
    } else {
      await getTrending.getSearchImages(widget.query);
    }

    searchModel = getTrending.wallpapers;

    //print(searchModel);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onScreensearch = false;
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              //search textfield
              searchTextField(searchText, () {
                print(searchText.text);
                setState(() {
                  onScreensearch = true;
                });
                print(onScreensearch);
                getImages();
              }),
//search label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "showing resluts for: ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onScreensearch
                        ? Text(
                            "\'${searchText.text}'",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "\'${widget.query}'",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                  ],
                ),
              ),
              //search body
              imageList(wallpapers: searchModel, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
