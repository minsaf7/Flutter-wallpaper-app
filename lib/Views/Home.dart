import 'package:flutter/material.dart';
import 'package:futtergallery/Data/APICalls.dart';
import 'package:futtergallery/Data/data.dart';
import 'package:futtergallery/Models/CategoryModel.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';
import 'package:futtergallery/Views/Category.dart';
import 'package:futtergallery/Widgets/Widgets.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryModel = [];
  List<WallpaperModel> wallmodel = [];
  bool isLoading = true;

  // getTrendingImages() async {
  //   var response = await http.get(
  //       Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
  //       headers: {"Authorization": apiKey});
  //   print(response.body.toString());
  // }

  getImages() async {
    APICalls getTrending = APICalls();
    await getTrending.getTrendingImages();
    wallmodel = getTrending.wallpapers;
    print(wallmodel);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryModel = getCategory();
    getImages();
    // getTrending.getTrendingImages();
    // wallmodel = getTrending.wallpapers;
    // wallmodel =

    //print(categoryModel);
    //getTrendingImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: topBar(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              //search textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "search",
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //mady by label
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Developed by "),
                  Text(
                    "Minsaf",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //categoty list
              Container(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // itemCount: categoryModel.length,
                    itemCount: categoryModel.length,
                    itemBuilder: (context, index) {
                      // print(wallmodel[index].photographer);
                      return CategoryTile(
                          categoryTitle: categoryModel[index].categoryTitle,
                          imageUrl: categoryModel[index].imageUrl);
                    }),
              ),

              //body
              SizedBox(height: 10),

              imageList(wallpapers: wallmodel, context: context),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

//category couresal
class CategoryTile extends StatelessWidget {
  final imageUrl, categoryTitle;
  const CategoryTile({Key? key, this.imageUrl, this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => Category(
                      categoryTitle: categoryTitle,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl!,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Text(
                categoryTitle!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
