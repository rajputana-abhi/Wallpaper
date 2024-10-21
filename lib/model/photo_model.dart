// import 'dart:js_interop';

class PhotosModel {
  String imagsrc;
  String PhotoName;

  PhotosModel({required this.PhotoName, required this.imagsrc});

  static PhotosModel fromAPItoApp(Map<String, dynamic> photomap) {
    return PhotosModel(
        PhotoName: photomap["photographer"],
        imagsrc: (photomap["src"])["portrait"]);
  }
}
