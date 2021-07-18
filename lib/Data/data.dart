import 'package:futtergallery/Models/CategoryModel.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> categories = [];

//1
  CategoryModel model = CategoryModel();
  model.categoryTitle = "Art";
  model.imageUrl =
      "https://images.glaciermedia.ca/polopoly_fs/1.24212567.1601479674!/fileImage/httpImage/image.jpg_gen/derivatives/landscape_804/kamloops-art-page-2.jpg";

  categories.add(model);

  //2
  model = CategoryModel();
  model.categoryTitle = "Wildlife";
  model.imageUrl =
      "https://img.traveltriangle.com/blog/wp-content/uploads/2018/11/tanzania-wildlife-cover.jpg";

  categories.add(model);

  //3
  model = CategoryModel();
  model.categoryTitle = "Nature";
  model.imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy51amIASYS9s48OcXkv98AmqBzGXa5FbrLwoX-MG34LYedIt6TedtYeethAeXicYP8lI&usqp=CAU";

  categories.add(model);

  //4
  model = CategoryModel();
  model.categoryTitle = "Ocean";
  model.imageUrl =
      "https://www.indianoceanfuture.lk/wp-content/uploads/2018/09/banner-1.jpg";

  categories.add(model);

  //5
  model = CategoryModel();
  model.categoryTitle = "City";
  model.imageUrl =
      "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2l0eXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80";

  categories.add(model);

  return categories;
}
