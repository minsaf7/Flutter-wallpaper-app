class WallpaperModel {
  late String? photographer;
  late String? photographerUrl;
  late int? photographerId;
  late SourceModel? src;

  WallpaperModel(
      {this.photographer, this.photographerId, this.photographerUrl, this.src});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
        photographer: json['photographer'],
        photographerId: json['photographer_id'],
        photographerUrl: json['photographer_url'],
        src: SourceModel.fromJson(json["src"]));
  }
}

class SourceModel {
  late String original;

  late String small;
  late String portrait;
  SourceModel(
      {required this.original, required this.portrait, required this.small});

  factory SourceModel.fromJson(Map<String, dynamic> jsonData) {
    return SourceModel(
        original: jsonData["original"],
        portrait: jsonData["portrait"],
        small: jsonData["small"]);
  }
}
