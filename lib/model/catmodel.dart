class CategoryModel {
  String catName;
  String catImgUrl;
  CategoryModel({required this.catImgUrl, required this.catName});

  static CategoryModel fromapitoApp(Map<String, dynamic> category) {
    return CategoryModel(
        catImgUrl: category['imgurl'], catName: category['categoryname']);
  }
}
