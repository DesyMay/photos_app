class ImageModel {
  int? id;
  String? largeImageURL;
  int? likes;
  int? views;

  ImageModel({
    this.id,
    this.largeImageURL,
    this.likes,
    this.views,
  });

  ImageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        largeImageURL = json['largeImageURL'],
        likes = json['likes'],
        views = json['views'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'largeImageURL': largeImageURL,
        'likes': likes,
        'views': views,
      };

  @override
  String toString() =>
      'ImageModel : {id : $id, largeImageURL : $largeImageURL, likes : $likes, views : $views}';
}
