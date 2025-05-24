class Photo {
  final int albumId;
  final int id;
  final String url;
  final String title;
  final String thumbnailUrl;
  static const String defaultImageUrl = 'https://via.placeholder.com/150';

  Photo({required this.id, required this.url, required this.title, required this.albumId, required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) =>
      Photo(id: json["id"], albumId: json["albumId"], title: json["title"], url: json["url"], thumbnailUrl: json["thumbnailUrl"]);

  Map<String, dynamic> toJson() {
    return {'url': url, 'thumbnailUrl': thumbnailUrl};
  }
}
