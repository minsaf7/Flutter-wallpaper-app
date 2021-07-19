import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';

Widget topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Flutter"),
      Text("Wallpaper", style: TextStyle(color: Colors.red)),
    ],
  );
}

Widget imageList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wPapers) {
        return GridTile(
            child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              wPapers.src!.portrait,
              fit: BoxFit.cover,
            ),
          ),
        ));
      }).toList(),
    ),
  );
}

Widget searchTextField(TextEditingController controller, void func()) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: TextField(
        controller: controller,
        onChanged: (val) {
          val = controller.text;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "search",
          suffixIcon: IconButton(
              onPressed: func,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        ),
      ),
    ),
  );
}
