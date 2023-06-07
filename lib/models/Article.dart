class Article {
  String uuid;
  String title;
  String description;
  String snippet;
  String imageUrl;
  String publishedAt;

  Article({
    required this.uuid,
    required this.title,
    required this.description,
    required this.snippet,
    required this.imageUrl,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    uuid: json["uuid"],
    title: json["title"],
    description: json["description"],
    snippet: json["snippet"],
    imageUrl: json["image_url"],
    publishedAt: json["published_at"],
  );
}