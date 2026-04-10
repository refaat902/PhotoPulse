class FavoriteModel {
  final String id;
  final String imageUrl;
  final bool isFavorite;

  FavoriteModel({
    required this.id,
    required this.imageUrl,
    required this.isFavorite,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json['id'],
        imageUrl: json['imageUrl'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'isFavorite': isFavorite,
      };
}