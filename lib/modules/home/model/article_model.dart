class ArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String urlToImage;
  final String? publishedAt;
  final String? content;
  // final SourceModel? source;
  final SourceModel? source;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> jsonResponse) {
    return ArticleModel(
      source: jsonResponse["source"] != null
          ? SourceModel.fromJson(jsonResponse["source"])
          : null,
      author: jsonResponse["author"],
      title: jsonResponse["title"],
      description: jsonResponse["description"],
      url: jsonResponse["url"],
      urlToImage: jsonResponse["urlToImage"] ??
          "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
      publishedAt: jsonResponse["publishedAt"],
      content: jsonResponse["content"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "source": source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content
    };
  }
}
class SourceModel {
  final String? id;
  final String? name;
  SourceModel({
    required this.id,
    required this.name,
  });
  factory SourceModel.fromJson(Map<String, dynamic> jsonResponse) {
    return SourceModel(
      id: jsonResponse["id"],
      name: jsonResponse["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
